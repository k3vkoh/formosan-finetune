import os
import pytesseract
from PIL import Image
from pdf2image import convert_from_path

# Set the path to the Tesseract executable if it's not in your PATH
# change this path if it different for you
pytesseract.pytesseract.tesseract_cmd = '/usr/local/bin/tesseract'

# change these for you language
# change the path and language to your needs
file_path = 'example/yami.pdf'
lang = 'yami'

images = convert_from_path(file_path)

yami=''
english=''

for i, image in enumerate(images):

	# Apply OCR to the image
	if i in range(52,80):
		text = pytesseract.image_to_string(image, lang=lang).replace('\n', ' ')
		if i%2==0:
			yami+=f"page {i+1} "
			yami+=text
		else:
			english+=f"page {i+1} "
			english+=text

with open('yami_yami.txt', 'w') as file:
    file.write(yami)

with open('yami_english.txt', 'w') as file:
    file.write(english)