#include "ros/ros.h"
#include "serial_pkg/Serial_rw.h"
#include "std_msgs/String.h"

#if 0
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
	ROS_INFO("I heard: [%s]", msg->data.c_str());
}
#endif

void chatterCallback(const serial_pkg::Serial_rw::ConstPtr& msg)
{
	ROS_INFO("I heard: [%c]", msg->data_r);
	ROS_INFO("I heard: [%c]", msg->data_w);

}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "listener");

	ros::NodeHandle n;

	ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

	ros::spin();

	return 0;
}
