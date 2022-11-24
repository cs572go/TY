import cv2
from cvzone.FaceDetectionModule import FaceDetector

cam=cv2.VideoCapture(0)
detection=FaceDetector(minDetectionCon=0.7)

while True:
    success, img=cam.read()
    img, face=detection.findFaces(img)
    cv2.imshow("Video", img)
    cv2.waitKey(1)