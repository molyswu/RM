#include <iostream>  
#include <string>  
#include <vector>   
// OpenCV头文件  
#include <opencv2/photo.hpp>  
#include <opencv2/highgui.hpp>   
// OpenNI头文件  
#include <OpenNI.h>  
using namespace cv;
using namespace std;
int main(int argc, char** argv )
{	
	openni::Device device;
	openni::VideoStream depth,color,ir;
	openni::OpenNI::initialize();
	device.open(openni::ANY_DEVICE);
	ir.create(device,openni::SENSOR_IR);
	depth.create(device, openni::SENSOR_DEPTH);
	color.create(device, openni::SENSOR_COLOR);	
	openni::VideoMode vm=depth.getVideoMode();
	openni::VideoMode vm2=color.getVideoMode();
	int cols,rows;
	cols=vm.getResolutionX();
	rows=vm.getResolutionY();
	openni::VideoFrameRef depthFrame;
	openni::VideoFrameRef colorFrame;
	depth.start();
	color.start();
	Mat cvBGRImg,cvDepthImg;
	while(true){
		//if(color.readFrame(colorFrame) == STATUS_OK){
			color.readFrame(&colorFrame);
			Mat cvRGBImg( colorFrame.getHeight(), colorFrame.getWidth(), CV_8UC3, (void*)colorFrame.getData() );      
			cvtColor( cvRGBImg, cvBGRImg, CV_RGB2BGR );    
            imshow( "image", cvBGRImg );   
		//}
		//if( depth.readFrame( &depthFrame ) == STATUS_OK ) { 
			depth.readFrame(&depthFrame); 
            Mat cvRawImg16U( depthFrame.getHeight(), depthFrame.getWidth(), CV_16UC1, (void*)depthFrame.getData() );    
            cvRawImg16U.convertTo( cvDepthImg, CV_8U, 255.0/(depth.getMaxPixelValue()));      
            imshow( "depth", cvDepthImg );    
        //}  
	}
	depth.stop();
	color.stop();
	return 0;
}



	/*VideoCapture capture( CV_CAP_OPENNI );
capture.set( CV_CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE, CV_CAP_OPENNI_VGA_30HZ );
cout << "FPS    " << capture.get( CV_CAP_OPENNI_IMAGE_GENERATOR+CV_CAP_PROP_FPS ) << endl;
for(;;)
{
    Mat depthMap;
    Mat bgrImage;

    capture.grab();

    capture.retrieve( depthMap, CV_CAP_OPENNI_DEPTH_MAP );
    capture.retrieve( bgrImage, CV_CAP_OPENNI_BGR_IMAGE );
    Mat show; 
    //if( retrievedImageFlags[0] && capture.retrieve( depthMap, CAP_OPENNI_DEPTH_MAP ) )
	//{
    	depthMap.convertTo( show, CV_8UC1, 0.05f );
    	imshow("image",show);
    //}*/
