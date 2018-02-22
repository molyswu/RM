#include <cstdio>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;



void CallBackFunc(int event, int x, int y, int flags, void* param)
{    
  if  ( event == EVENT_LBUTTONDOWN )
    {   
      Mat &depthMap = *((Mat*)param);
      double depth = depthMap.at<uint16_t>(y,x);
      //cout << depth << endl;
      double Tx = (x - 313.308307869799)/513.3605800901698 * depth;
      double Ty =  (y - 261.3256090654382)/516.1600538269478 * depth;
      //float Tx = (x - 316.8262502042444)/601.4832136255365 * depth;
      //float Ty = (y - 239.0853420880023)/603.1281635259959 * depth;
      

      //Mat p_camera =  (Mat_<double>(3,1) << Tx/1000.0, Ty/1000.0, depth/1000.0);
      Mat p_camera =  (Mat_<double>(3,1) << depth/1000.0, Tx/1000.0, -Ty/1000.0);//camera coordinates = base coordinates
      cout << "pose in camera: "<< p_camera <<  endl;
      //from camera to wolrd 0.714 -0.175 0.510 0.446

      Mat translation = (Mat_<double>(3,1) <<  0.130, -0.003, 0.542);
      Mat rotation = (Mat_<double>(3,3) <<   0.8018886, -0.0861547,  0.5912293,
   0.0961098,  0.9952625,  0.0146765,
  -0.5896928,  0.0450540,  0.8063700 ); 
      Mat r_t;
      transpose(rotation, r_t);
      //cout << -r_t*translation <<endl;
      cout<< rotation*p_camera + translation << endl;
      //cout << r_t*p_camera - r_t*translation << endl;
      //cout << "pose in world:" << result << endl;
  } 
}
int main(int argc, char **argv){
  VideoCapture cap(CV_CAP_OPENNI);
  cap.set( CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE, CAP_OPENNI_VGA_30HZ );
  //cout << "FPS   " << cap.get( CAP_OPENNI_IMAGE_GENERATOR+CAP_PROP_FPS ) << endl;
  Mat depthImage, bgrImage, depthMap;
  int i = 0;
  if ( !cap.isOpened() ) {
  	cerr << "Cannot get video stream!" << endl;
	}
  while(true){
    cap.grab();
    cap.retrieve(depthMap, CAP_OPENNI_DEPTH_MAP); //depth value in mm.
    cap.retrieve(bgrImage, CV_CAP_OPENNI_BGR_IMAGE);
    // const float scaleFactor = 0.05f;
    // depthMap.convertTo( depthImage, CV_8UC1, scaleFactor );
    //     imshow("Depth", depthImage);
    imshow("Color", bgrImage);

    setMouseCallback("Color", CallBackFunc, (void*)&depthMap);
    if(waitKey(1) == 'p') break;
  }
  return 0;
}