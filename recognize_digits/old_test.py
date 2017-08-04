# USAGE
# python recognize_digits.py

# import the necessary packages
from imutils.perspective import four_point_transform
import imutils
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

# construct the argument parser and parse the arguments
 
# load the image image, convert it to grayscale, and detect edges
template = cv2.imread("template2.jpg")

(tH, tW) = template.shape[:2]
# capture the digital clock, para*
frame = cv2.imread("test.jpg")
	# pre-process the image by resizing it, converting it to
	# graycale, blurring it, and computing an edge map
frame = imutils.resize(frame, height=500, width=415)
gray = cv2.cvtColor(template, cv2.COLOR_BGR2GRAY)
w, h = gray.shape[::-1]
res = cv2.matchTemplate(frame,template,cv2.TM_CCOEFF)
min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
top_left = max_loc
bottom_right = (top_left[0] + w, top_left[1] + h)
cv2.rectangle(frame,top_left, bottom_right, 255, 2)
frame = frame[top_left[1]:bottom_right[1],top_left[0]:bottom_right[0]]
kernel = np.ones((5,5),np.uint8)
lower = np.array([104, 186, 0], dtype = "uint8")
higher = np.array([255, 255, 255], dtype = "uint8")


cv2.imshow("template.jpg",template)
blurred = cv2.GaussianBlur(frame, (5, 5), 0)
edged = cv2.inRange(blurred,lower, higher)

kernel2 = np.ones((2,2),np.uint8)
edged= cv2.dilate(edged, kernel2, iterations = 1)
# find contours in the edge map, then sort them by their
# size in descending order
##
'''
cnts = cv2.findContours(edged.copy(), cv2.RETR_EXTERNAL,
	cv2.CHAIN_APPROX_SIMPLE)
cnts = cnts[0] if imutils.is_cv2() else cnts[1]
cnts = sorted(cnts, key=cv2.contourArea, reverse=True)

cv2.waitKey(0)


displayCnt = None
# loop over the contours
for c in cnts:
	# approximate the contour
	peri = cv2.arcLength(c, True)
	approx = cv2.approxPolyDP(c, 0.02 * peri, True)

	# if the contour has four vertices, then we have found
	# the thermostat display
	if len(approx) == 4:
		displayCnt = approx
		break

# extract the thermostat display, apply a perspective transform
# to it
print displayCnt
cv2.imshow("displayCnt",displayCnt)
warped = four_point_transform(gray, displayCnt.reshape(4, 2))
output = four_point_transform(frame, displayCnt.reshape(4, 2))

# threshold the warped image, then apply a series of morphological
# operations to cleanup the thresholded image

thresh = cv2.threshold(edged, 0, 255,
	cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]

kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5,5))

thresh = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel)
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
	

	# if the contour is sufficiently large, it must be a digit
	if w >= 15 and (h >= 30 and h <=  40) :
		digitCnts.append(c)
		cv2.rectangle(edged, (x, y), (x + w, y + h), (255, 255, 0), 1)
# sort the contours from left-to-right, then initialize the
# actual digits themselves
digitCnts = contours.sort_contours(digitCnts, method="left-to-right")[0]
digits = []
# loop over each of the digits
cv2.imshow("edged", edged)

for c in digitCnts:
	# extract the digit ROI
	(x, y, w, h) = cv2.boundingRect(c)
	roi = edged[y:y + h, x:x + w]
	# compute the width and height of each of the 7 segments
	# we are going to examiimne
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
		if total / float(area) > 0.6:
			on[i]= 1
			
	# lookup the digit and draw it on the image
	digit = DIGITS_LOOKUP[tuple(on)]
	digits.append(digit)
	cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 1)
	cv2.putText(frame, str(digit), (x - 10, y - 10),
		cv2.FONT_HERSHEY_SIMPLEX, 0.65, (0, 255, 0), 2)

# display the digits
print digits
cv2.imshow("Input", frame)
cv2.waitKey(0)