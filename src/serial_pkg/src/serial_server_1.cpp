#include "ros/ros.h"
#include "serial_pkg/Serial.h"


#include <iostream>
#include <fstream>
#include <string>



#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <termios.h>
//#include "serial.h"

void serial_init(int fd)
{
    struct termios options;
    
	tcgetattr(fd, &options);
	options.c_cflag |= (CLOCAL | CREAD);
	options.c_cflag &= ~CSIZE;
	options.c_cflag &= ~CRTSCTS;
	options.c_cflag |= CS8;
	options.c_cflag &= ~CSTOPB; 
	options.c_iflag |= IGNPAR;
	options.c_iflag &= ~(BRKINT | INPCK | ISTRIP | ICRNL | IXON);
    
//   options.c_cc[VTIME] = 2;
    options.c_cc[VMIN] = 12;
#if 0    
	options.c_oflag = 0;
	options.c_lflag = 0;
#endif 
	options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
	options.c_oflag &= ~OPOST;

	cfsetispeed(&options, B115200);
	cfsetospeed(&options, B115200);
    
	tcsetattr(fd,TCSANOW,&options);

    printf("zigbee serial ok!\n");
    
}

int writechar(const char *argv)
{
	
	int fd;
	int len;

	printf("here read serial\n");
	
	fd = open("/dev/ttyUSB0",O_RDWR,0664);		
	if(fd < 0)
	{
		perror("fail to open ttyUSB0");
		return -1;
	}

	printf("open ttyUSB0\n");
	
	serial_init(fd); //串口初始化
	
	const char *data = argv;

	len = write(fd,data,1);

	close(fd);

	return len;
			
	
}

int writestr(const char *argv)
{
	int len = 0;
	const char *p = argv;
	
	while(writechar(p)){
		p ++;
		len ++;
	}

	return len;

}

bool writestring(serial_pkg::Serial::Request &req,
				serial_pkg::Serial::Response &res)
{
	int len ;
	res.data_dest = 'a';
	const char* data = res.data_dest.data();

	len = writechar(data);

	ROS_INFO("request: x=%s, ", data);

	return true;
}
int readchar(const char *argv)
{
	
	int fd;
	int len;

	printf("here write serial\n");
	
	fd = open("/dev/ttyUSB0",O_RDWR,0664);		
	if(fd < 0)
	{
		perror("fail to open ttyUSB0");
		return -1;
	}

	printf("open ttyUSB0\n");
	
	serial_init(fd); //串口初始化
	
	const char *data = argv;

	len = read(fd,(void *)data,1);

	close(fd);

	return len;
}


int readstr(const char *argv)
{
	int len = 0;
	const char *p = argv;

	while(readchar(p)){
		p ++;
		len ++;
	}

	return len;
}

int main(int argc,  char **argv)
{
	ros::init(argc,argv,"serial_server");
	ros::NodeHandle nh;

	ros::ServiceServer service = nh.advertiseService("serial_write",writestring);
	ROS_INFO("serial write");
	ros::spin();

	return 0;
}
