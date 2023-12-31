import os
import pytesseract
from PIL import Image

# Set the path to the Tesseract executable if it's not in your PATH
# change this path if it different for you
pytesseract.pytesseract.tesseract_cmd = '/usr/local/bin/tesseract'

# change these for you language
# change the path and language to your needs
folder_path = 'favorlang-test'
lang = 'favorlang'

for filename in os.listdir(folder_path):
    if os.path.splitext(filename)[1].lower() == '.png':
        image_path = os.path.join(folder_path, filename)

        image = Image.open(image_path)

        text_trained = pytesseract.image_to_string(image, lang=lang)
        text_untrained = pytesseract.image_to_string(image)

        print(filename)
        print(text_trained.strip())
        print(text_untrained.strip())
        print('x'*20)
