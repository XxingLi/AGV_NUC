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
int fd;

void serial_init(void)
{
    struct termios options;

	fd = open("/dev/ttyUSB0",O_RDWR|O_NONBLOCK,0664);		
	if(fd < 0)
	{
		perror("fail to open ttyUSB0");
	}
    
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

   // printf("zigbee serial ok!\n");
    
}

int writechar(const char *argv)
{
	int len;	
	const char *data = argv;

	len = write(fd,data,1);

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

int readchar(const char *argv)
{
	
	int len;
	const char *data = argv;

	len = read(fd,(void *)data,1);

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

bool writestring(serial_pkg::Serial::Request &req,
				serial_pkg::Serial::Response &res)
{
	int len ;
//	uint8_t *data = &res.data_dest;
	res.write_data = 'a';
	
	if(1 == req.flag_write)
	{
		len = writechar((const char *)&res.write_data);
		if(len < 0)
		{
			ROS_INFO("Write error");
			return false;
		}
	}

	if(1 == req.flag_read)
	{
		len = readchar((const char *)&res.read_data);
		if(len < 0)
		{
			ROS_INFO("Read error");
			return false;
		}
	}

	ROS_INFO("writechar: %c", res.write_data);
	ROS_INFO("readchar: %c",res.read_data);

	return true;
}

int main(int argc,  char **argv)
{
	serial_init();   //串口初始化

	ros::init(argc,argv,"serial_server");
	ros::NodeHandle nh;

	ros::ServiceServer service = nh.advertiseService("serial_write",writestring);
	ROS_INFO("serial write");
	ros::spin();

	close(fd);
	return 0;
}
