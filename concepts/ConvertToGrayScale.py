import sys
import cv2
file_path = sys.argv[1]
image = cv2.imread(file_path)
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
cv2.imwrite(file_path, gray)