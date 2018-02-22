#include <cstdio>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;
int main(int argc, char **argv){
	VideoCapture cap(CV_CAP_OPENNI);
	// double dWidth = cap.get(CV_CAP_PROP_FRAME_WIDTH); 
	// double dHeight = cap.get(CV_CAP_PROP_FRAME_HEIGHT); 
	// cout << "Frame Size = " << dWidth << "x" << dHeight << endl;
	// Size frameSize(static_cast<int>(dWidth), static_cast<int>(dHeight));
	// VideoWriter colorVideoWriter ("colorVideo.avi", CV_FOURCC('P','I','M','1'), 30, frameSize, true); 
	// VideoWriter depthVideoWriter ("depthVideo.oni", CV_FOURCC('P','I','M','1'), 30, frameSize, false); 

	cap.set( CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE, CAP_OPENNI_SXGA_30HZ );
	cout << cap.get(CV_CAP_PROP_FRAME_WIDTH) << ", "	<< cap.get(CV_CAP_PROP_FRAME_HEIGHT) <<
	cap.get(CAP_PROP_OPENNI_REGISTRATION) <<	endl;

	//cap.set(CAP_PROP_AUTO_EXPOSURE, 0.25);
	//cout << cap.get(CAP_PROP_MODE);
	//cout << "FPS	 " << cap.get( CAP_OPENNI_IMAGE_GENERATOR+CAP_PROP_FPS ) << endl;
	//Mat camera_matrix =	(cv::Mat_<double>(3,3) << 600, 0, 319, 0 , 600, 240, 0, 0, 1);
	//cout << calibrateCamera() <<endl;
	Mat depthimage, bgrImage, depthMap;
	char colorName[20];
	char depthName[20];
	int i = 0;
	if ( !cap.isOpened() ) {
		cerr << "Cannot get video stream!" << endl;
	}
	while(true){
	cap.grab();
	cap.retrieve(depthMap, CAP_OPENNI_DEPTH_MAP);
	cap.retrieve(bgrImage, CV_CAP_OPENNI_BGR_IMAGE);
	//Mat cropped_color = bgrImage(cv::Rect(160, 120, 320, 240));
	//Mat cropped_depth = depthMap(cv::Rect(160, 120, 320, 240));//depth is always 640 480, so there's an issue.
	//depthMap.convertTo( depthImage, CV_8UC1, scaleFactor );
	sprintf(depthName, "%s%d%s", "./depth/image", i, ".png"); 
	sprintf(colorName, "%s%d%s", "./color/image", i, ".png"); 
	//imshow("Depth", depthMap);
	imshow("Color", bgrImage);
	if(waitKey(30) == 's'){
		imwrite(colorName, bgrImage);
		imwrite(depthName, depthMap);	
		i++;
	}

	if(waitKey(1) == 'p') break;
	}
	return 0;
}