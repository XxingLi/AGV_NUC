#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
//#include "std_msgs/String.h"
#include "std_msgs/UInt8.h"
//#include "serial_pkg/Serial_rw.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <termios.h>

#define SERIALSIZE 16

char data_stm[SERIALSIZE] = {0};
char twistmsg[SERIALSIZE];
int index_twist = 0;

int fd;

typedef union uion_data32
{
	float un_data32[3];
	char un_data8[12];
}twist32;
	


void serial_init(void)
{
    struct termios options;

	fd = open("/dev/ttyUSB0",O_RDWR|O_NONBLOCK,0664);		
	if(fd < 0)
	{
		perror("fail to open ttyUSB0");
		exit(1);
	}
    
	tcgetattr(fd, &options);
	options.c_cflag |= (CLOCAL | CREAD);
	options.c_cflag &= ~CSIZE;
	options.c_cflag &= ~CRTSCTS;
	options.c_cflag |= CS8;
	options.c_cflag &= ~CSTOPB; 
	options.c_iflag |= IGNPAR;
	options.c_iflag &= ~(BRKINT | INPCK | ISTRIP | ICRNL | IXON);
    
    options.c_cc[VMIN] = 12;

	options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
	options.c_oflag &= ~OPOST;

	cfsetispeed(&options, B115200);
	cfsetospeed(&options, B115200);
    
	tcsetattr(fd,TCSANOW,&options);

//	printf("serial port ok!\n");
    
}

int writechar(const char *argv)
{
	int len;	
	const char *data = argv;

	len = write(fd,data,1);

	return len;
			
}

int writestr(const char *argv,int len)
{
	const char *data = argv;
	int ret = 0;
	int i ;
	for(i = 0;i < len;i ++)
	{
		ret = writechar(data);
		if(1 == ret)
			data ++;
		else
			return ret;
	}

	return 0;
}

int readchar(void *argv)
{
	int len;
	void *data = argv;

	len = read(fd,data,1);

	return len;
}

int readstr(void *s,int len)
{
	int i;
	char *p = (char *)s;

	for(i = 0;i < len;i ++)
	{
		readchar((void*)p);
		p ++;
	}
}


void float_char(float f,char *s)
{
	int i;
	char *p = s;
	char *temp = (char *)&f;

	for(i = 0; i < 4; i ++)
	{
		p[i] = temp[i];
	}

}

void write_cb(const geometry_msgs::Twist::ConstPtr& msg)
{
	int i ;
	
//	char data_stm[SERIALSIZE];
	float temp;
	char *p = data_stm;
	
	data_stm[0] = 'J';
	data_stm[1] = 'Y';
	data_stm[2] = 'C';
	
	temp = msg->linear.x;
	float_char(temp,p + 3);
	temp = msg->linear.y;
	float_char(temp,p + 7);
	temp = msg->angular.z;
	float_char(temp,p + 11);	

	ROS_INFO("cmd_x :\t%f",msg->linear.x);
	ROS_INFO("cmd_y :\t%f",msg->linear.y);
	ROS_INFO("cmd_w :\t%f",msg->angular.z);

	
#if 0
	int ret = 0;
	ret = writestr(data_stm,SERIALSIZE);

	if(0 != ret )
	{
		perror("write_cb error on 156");
		exit(1);
	}
#endif
	
}

void updown_cb(const std_msgs::UInt8::ConstPtr& flag)
{
	data_stm[15] = flag->data;

	ROS_INFO("data_Stm[15]:\t%d",data_stm[15]);
	ROS_INFO("flag->data\t%d",flag->data);

}

geometry_msgs::Twist readserimsg(void)
{
	int len = 0;
	int size = 3;
	char head[size];
	char refer[3] = {'J','Y','C'};
	twist32 recvdata;
	geometry_msgs::Twist msg;
	
	int i = 0;
	while(i < size)
	{
		readchar((void *)&head[i]);
		if(head[i] != refer[i])
		{
			i = i;
		}
		else
			i ++;
	}
	
	len = SERIALSIZE - size;
	for(i = 0;i < len;i ++)
	{
		readstr(&recvdata.un_data8[i],len);
	}

	msg.linear.x = recvdata.un_data32[0];
	msg.linear.y = recvdata.un_data32[1];
	msg.angular.z = recvdata.un_data32[2];

	return msg;
}

int main(int argc, char **argv)
{
	serial_init();
	
	ros::init(argc, argv, "talker");

	ros::NodeHandle n;
	ros::NodeHandle n2;

	ros::Subscriber cmd_vel_Sub = n.subscribe("cmd_vel",1,write_cb);
	
	ros::Subscriber up_down_sub = n2.subscribe("updown_flag",1,updown_cb);

	ros::Publisher chatter_pub = n.advertise<geometry_msgs::Twist>("chatter", 1);

	ros::Rate loop_rate(25);
	
	int len = 0;
	int i = 0;
	float temp;
	uint8_t temp11;

	while (ros::ok())
	{
		geometry_msgs::Twist msg;

		msg = readserimsg();

		ROS_INFO("feedback x :\t%f",msg.linear.x);
		ROS_INFO("feedback y :\t%f",msg.linear.y);
		ROS_INFO("feedback w :\t%f",msg.angular.z);
		
		chatter_pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
#if 1		
		int ret = 0;
		ret = writestr(data_stm,SERIALSIZE);
		
		ROS_INFO("sreial_data[15] :\t%d",data_stm[15]);
		if(0 != ret )
		{
			perror("write_cb error on 156");
			exit(1);
		}
#endif

	}

	


	return 0;
}
