
# USAGE
# python recognize_digits.py

# import the necessary packages
from imutils.perspective import four_point_transform
from imutils import contours
from matplotlib import pyplot as plt
import numpy as np
import glob
import argparse
import imutils
import cv2
import sys
# define the dictionary of digit segments so we can identify
# each digit on the thermostat
DIGITS_LOOKUP = {
	(1, 1, 1, 0, 1, 1, 1): 0,
	(0, 0, 1, 0, 0, 1, 0): 1,
	(1, 0, 1, 1, 1, 1, 0): 2,
	(1, 0, 1, 1, 0, 1, 1): 3,
	(0, 1, 1, 1, 0, 1, 0): 4,
	(1, 1, 0, 1, 0, 1, 1): 5,
	(1, 1, 0, 1, 1, 1, 1): 6,
	(1, 0, 1, 0, 0, 1, 0): 7,
	(1, 1, 1, 1, 1, 1, 1): 8,
	(1, 1, 1, 1, 0, 1, 1): 9
}

# capture the video image
cap = cv2.VideoCapture(0)

count = 0
while(True) :
	ret, frame = cap.read() 

	# pre-process the image by resizing it, converting it to
	# graycale, blurring it, and computing an edge map
	frame = imutils.resize(frame, height=500, width=415)
	frame2 = frame
	cv2.rectangle(frame2,(135,224), (335,310),255,2)
	frame = frame[224:310, 135:335]
	'''frame = 	cv2.pyrDown(frame)
	frame = cv2.pyrDown(frame)
	
	gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
	blurred = cv2.GaussianBlur(gray, (5, 5), 0)
	edged = cv2.Canny(blurred, 50, 200, 255)
	'''

	blurred = cv2.GaussianBlur(frame, (5, 5), 0)
	#param might help filter out white margins, but try to be accurate.
	lower = np.array([80, 90, 60], dtype = "uint8")
	# Change to template matching. 
	higher = np.array([255, 235, 255], dtype = "uint8")
	edged = cv2.inRange(blurred, lower, higher)
	kernel2 = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(5,5))
	edged = cv2.dilate(edged, kernel2, iterations = 1)
	#for color thresholding


	#param
	#edged= cv2.dilate(edged, kernel2, iterations = 1)

	'kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))'
	'edged = cv2.morphologyEx(edged, cv2.MORPH_CLOSE, kernel)'

	# find contours in the edge map, then sort them by their
	# size in descending order
	'''
	cnts = cv2.findContours(edged.copy(), cv2.RETR_EXTERNAL,
		cv2.CHAIN_APPROX_SIMPLE)
	cv2.imshow("edged", edged)
	cv2.waitKey(1);
	cnts = cnts[0] if imutils.is_cv2() else cnts[1]
	cnts = sorted(cnts, key=cv2.contourArea, reverse=True)
	displayCnt = None
	# loop over the contours
	for c in cnts:
		# approximate the contour
		peri = cv2.arcLength(c, True)
		approx = cv2.approxPolyDP(c, 0.02 * peri, True)
		cv2.imshow("displayCnt", approx)
		# if the contour has four vertices, then we have found
		# the thermostat hdisplay
		if len(approx) == 4:
			displayCnt = approx
			break
	if displayCnt is None:
	    continue
	# extract the thermostat display, apply a perspective transform
	# to it
	warped = four_point_transform(gray, displayCnt.reshape(4, 2))
	output = four_point_transform(frame, displayCnt.reshape(4, 2))
	cv2.imshow("displayCnt", displayCnt)
	# threshold the warped image, then apply a series of morphological
	#operations to cleanup the thresholded image
	
	thresh = cv2.threshold(edged, 0, 255,
		cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
	kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
	thresh = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel)
	cv2.imshow("thresh", thresh)
	'''
	# find contours in the thresholded image, then initialize the
	# digit contours lists
	cnts = cv2.findContours(edged.copy(), cv2.RETR_EXTERNAL,
		cv2.CHAIN_APPROX_SIMPLE)
	cnts = cnts[0] if imutils.is_cv2() else cnts[1]
	digitCnts = []

	# loop over the digit area candidates
	for c in cnts:
		# compute the bounding box of the contour
		(x, y, w, h) = cv2.boundingRect(c)

		#cv2.rectangle(output, (x, y), (x + w, y + h), (0, 255, 0), 1)
		
		# if the contour is sufficiently large, it must be a digit
		# param
		if (w >= 30 and w <= 90) and (h >= 55 and h <= 90):
			digitCnts.append(c)
			cv2.rectangle(edged, (x, y), (x + w, y + h), 255, 2)
	if not digitCnts:
		cv2.imshow("edged",edged)
		cv2.imshow("input",frame2)	
		cv2.waitKey(26)
		continue
	# sort the contours from left-to-right, then initialize the
	# actual digits themselves
	#print "digitCnts", digitCnts
	# check this, probably the reason that it cant find the contout
	# is because of this.

	digitCnts = contours.sort_contours(digitCnts, 
		method="left-to-right")[0]
	#param
	digits = []

	cv2.imshow("edged",edged)
	#a,b,c,d = cv2.boundingRect(digitCnts)
	#cv2.rectangle(img,(a,b),(a+c,b+d),(0,255,0),2)
	# loop over each of the digits
	# print digitCnts[0].shape
	for c in digitCnts:
		# extract the digit ROI
		(x, y, w, h) = cv2.boundingRect(c)
		roi = edged[y:y + h, x:x + w]

		# compute the width and height of each of the 7 segments
		# we are going to examine
		(roiH, roiW) = roi.shape
		(dW, dH) = (int(roiW * 0.25), int(roiH * 0.15))
		dHC = int(roiH * 0.05)

		# define the set of 7 segments
		segments = [
			((0, 0), (w, dH)),	# top
			((0, 0), (dW, h // 2)),	# top-left
			((w - dW, 0), (w, h // 2)),	# top-right
			((0, (h // 2) - dHC) , (w, (h // 2) + dHC)), # center
			((0, h // 2), (dW, h)),	# bottom-left
			((w - dW, h // 2), (w, h)),	# bottom-right
			((0, h - dH), (w, h))	# bottom
		]
		on = [0] * len(segments)

		# loop over the segments
		for (i, ((xA, yA), (xB, yB))) in enumerate(segments):
			# extract the segment ROI, count the total number of
			# thresholded pixels in the segment, and then compute
			# the area of the segment
			segROI = roi[yA:yB, xA:xB]
			total = cv2.countNonZero(segROI)
			area = (xB - xA) * (yB - yA)

			# if the total number of non-zero pixels is greater than
			# 50% of the area, mark the segment as "on"
			#param

			if total / float(area) > 0.55:
				on[i]= 1

		
		# lookup the digit and draw it on the image
		try:
			digit = DIGITS_LOOKUP[tuple(on)]
		except KeyError:
			continue
			
		'digit = DIGITS_LOOKUP[tuple(on)]'
		digits.append(digit)
		cv2.rectangle(frame2, (x + 135, y + 224), (135 + x + w, 224 + y + h), 255, 1)
		cv2.putText(frame2, str(digit), (x + 125, y + 214),
			cv2.FONT_HERSHEY_SIMPLEX, 0.65, (0, 255, 0), 2)

	# display the digits
	#print(u"{}{}.{} \u00b0C".format(*digits))
	count = count + 1
	if count % 3 == 0:
		print digits
	cv2.imshow("input",frame2)	
	cv2.waitKey(25)

	#break;
cap.release()
cv2.destroyAllWindows()