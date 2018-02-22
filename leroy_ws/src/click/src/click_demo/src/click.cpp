#include <cstdio>
#include <opencv2/opencv.hpp>
#include "ros/ros.h"
#include <geometry_msgs/Pose.h>
using namespace std;
using namespace cv;
  geometry_msgs::Pose click_pose;
  double tag = 0.0;
  double p_x = 313.308307869799;
  double p_y = 261.3256090654382;
  double f_x = 513.3605800901698;
  double f_y = 516.1600538269478;
  Mat translation = (Mat_<double>(3,1) <<  0.124, 0.016, 0.510);//already has the offset
  Mat rotation = (Mat_<double>(3,3) <<    0.7803892, -0.0371565,  0.6241891,
                                          0.0345114,  0.9992708,  0.0163366,
                                          -0.6243410,  0.0087927,  0.7811025 ); 

  void CallBackFunc(int event, int x, int y, int flags, void* param)
  {    
    if  ( event == EVENT_LBUTTONDOWN )
    {   
      Mat &depthMap = *((Mat*)param);
      double depth = depthMap.at<uint16_t>(y,x);// - 20 -2 cm as offset
      //cout << depth << endl;
      double Tx = (x - p_x)/ f_x * depth;
      double Ty =  (y - p_y)/ f_y * depth;
      //Mat p_camera =  (Mat_<double>(3,1) << Tx/1000.0, Ty/1000.0, depth/1000.0); // for go_local, Tx is negative
      Mat p_camera =  (Mat_<double>(3,1) << depth/1000.0, -Tx/1000.0, -Ty/1000.0);//camera coordinates = base coordinates
      Mat p_base = rotation*p_camera + translation ; 
      click_pose.position.x =  p_base.at<double>(0) + 0.1;//a little bit  farther
      click_pose.position.y = p_base.at<double>(1);//offset
      click_pose.position.z =  p_base.at<double>(2);
  } 
}
int main(int argc, char **argv){
  ros::init(argc, argv, "click_");
  ros::NodeHandle n; 
  ros::Publisher pose_pub = n.advertise<geometry_msgs::Pose>("click_points", 10);
  ros::Rate loop_rate(10);
  VideoCapture cap(CV_CAP_OPENNI);
  cap.set( CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE, CAP_OPENNI_VGA_30HZ );
  //cout << "FPS   " << cap.get( CAP_OPENNI_IMAGE_GENERATOR+CAP_PROP_FPS ) << endl;
  Mat depthImage, bgrImage, depthMap;
  if ( !cap.isOpened() ) {
  	cerr << "Cannot get video stream!" << endl;
	}
  while(ros::ok()){
    cap.grab();
    cap.retrieve(depthMap, CAP_OPENNI_DEPTH_MAP); //depth value in mm.
    cap.retrieve(bgrImage, CV_CAP_OPENNI_BGR_IMAGE);
    imshow("Color", bgrImage);
    setMouseCallback("Color", CallBackFunc, (void*)&depthMap);
    if(tag != click_pose.position.x) pose_pub.publish(click_pose);
    tag = click_pose.position.x;
    if(waitKey(1) == 'p') break;
    loop_rate.sleep();
    ros::spinOnce();

  }

  return 0;
}