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
			yami+=text
		else:
			english+=text


yami_list = yami.split('/')
english_list = english.split('/')

with open('yami.txt', 'w') as file:
    for item in yami_list:
        file.write(f"{item}\n")

with open('english.txt', 'w') as file:
    for item in english_list:
        file.write(f"{item}\n")