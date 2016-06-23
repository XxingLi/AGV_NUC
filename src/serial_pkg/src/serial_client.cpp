#include "ros/ros.h"
#include "serial_pkg/Serial.h"
#include <cstdlib>

int main(int argc, char **argv)
{
	  ros::init(argc, argv, "serial_client");

	  ros::NodeHandle n;
	  ros::ServiceClient client = n.serviceClient<serial_pkg::Serial>("serial_write");
	
	  serial_pkg::Serial srv;
	
	  
	  while(1)
	  {

		 srv.request.flag_write = 1; //写标志位置1
		 srv.request.flag_read = 1; //读标志位置1

#if 0
		 if(client.call(srv))//调用服务
		 {
		   ......
		   ......
		   srv.flag_write = 0; //调用完之后写标志位清零
		   srv.flag_read = 0;  //调用完之后读标志位清零
		 }
#endif
		  if (client.call(srv))
		  {
			  ROS_INFO("write: %c", srv.response.write_data);
			  ROS_INFO("read : %c", srv.response.read_data);
		  }
		  else
		  {
			  ROS_ERROR("Failed to call service serial_server");
			  return 1;
		  }
	  }

	  return 0;
}


