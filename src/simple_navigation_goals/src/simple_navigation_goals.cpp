#include "ros/ros.h"
#include "std_msgs/UInt8.h"
#include "move_base_msgs/MoveBaseAction.h"
#include "actionlib/client/simple_action_client.h"

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

int main(int argc, char** argv){

	ros::init(argc, argv, "simple_navigation_goals");
	//tell the action client that we want to spin a thread by default
	MoveBaseClient ac("move_base", true);
	move_base_msgs::MoveBaseGoal goal;
	goal.target_pose.header.frame_id = "map";
	goal.target_pose.header.stamp = ros::Time::now();
	MoveBaseClient ac2("move_base", true);
	MoveBaseClient ac0("move_base", true);


	ros::Rate r(100);
	ros::NodeHandle n;
	int flag = 0;

	int sum = 0;

	ros::Publisher updown_flag = n.advertise<std_msgs::UInt8>("updown_flag",1);
	//std_msgs::UInt8 ud_flag;

	while(ros::ok())
		
	{

		ROS_INFO("sum \t%d",sum);
		ROS_INFO("flag \t%d",flag);
		sum ++;
		switch(flag)
			
		{	
				
		case 0:{
						ROS_INFO("Hooray, the base moved 0 meter forward 0");

						//wait for the action server to come up

						while(!ac.waitForServer(ros::Duration(5.0))){
							ROS_INFO("Waiting for the move_base action server to come up");
						} 

						goal.target_pose.pose.position.x = 20;
						goal.target_pose.pose.position.y = 2.1;
						goal.target_pose.pose.orientation.z = 0;
						goal.target_pose.pose.orientation.w = 1;

						ROS_INFO("Sending goal");
						ac.sendGoal(goal);

						ac.waitForResult();

						if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
						{
							ROS_INFO("Hooray, the base moved 0 meter forward ");

							//ud_flag.data = 1;
							//updown_flag.publish(ud_flag);
							ros::Duration(120).sleep();
							//ud_flag.data = 2;
							//updown_flag.publish(ud_flag);
							//ros::Duration(23).sleep();

							flag = 1;

						}

						else
							ROS_INFO("The base failed to move forward 0 meter for some reason");
						break;
			   }
		case 1:{
				   //wait for the action server to come up
				   while(!ac.waitForServer(ros::Duration(5.0))){
					   ROS_INFO("Waiting for the move_base action server to come up");
				   }

				   goal.target_pose.pose.position.x = 0;
				   goal.target_pose.pose.position.y = 0;
				   goal.target_pose.pose.orientation.z = 0;
				   goal.target_pose.pose.orientation.w = 1;

				   ROS_INFO("Sending goal");
				   ac.sendGoal(goal);

				   ac.waitForResult();

				   if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
				   {
					   ROS_INFO("Hooray, the base moved 1 meter forward");

					   //ud_flag.data = 1;
					   //updown_flag.publish(ud_flag);
					   ros::Duration(2000).sleep();
					   //ud_flag.data = 2;
					   //updown_flag.publish(ud_flag);
					   //ros::Duration(23).sleep();
					   flag = 2;

				   }

				   else
					   ROS_INFO("The base failed to move forward 1 meter for some reason");
				   break;
			   }

		
		case 2:	{
					ROS_INFO("Hooray, the base moved 2 meter forward 0");
					//wait for the action server to come up

					while(!ac.waitForServer(ros::Duration(5.0))){
						ROS_INFO("Waiting for the move_base action server to come up");
					}


					goal.target_pose.pose.position.x = 0;
					goal.target_pose.pose.position.y = 0;
					goal.target_pose.pose.orientation.z = 0;
					goal.target_pose.pose.orientation.w = 1;

					ROS_INFO("Sending goal");
					ac.sendGoal(goal);

					ac.waitForResult();

					if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
					{
						ROS_INFO("Hooray, the base moved 2 meter forward");

							//ud_flag.data = 1;
							//updown_flag.publish(ud_flag);
							ros::Duration(20).sleep();
							//ud_flag.data = 2;
							//updown_flag.publish(ud_flag);
							//ros::Duration(60).sleep();
						flag = 0;

					}

					else
						ROS_INFO("The base failed to move forward 2 meter for some reason");
					break;
				}


		}


	}

	return 0;
}
