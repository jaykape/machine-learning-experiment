from pathlib import Path
import cv2

INPUT = Path("sample.jpg")
OUTPUT = Path("depth_output.jpg")

if INPUT.exists():
    img = cv2.imread(str(INPUT))
    depth = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    cv2.imwrite(str(OUTPUT), depth)
else:
    print("Put sample.jpg in this folder and rerun.")
