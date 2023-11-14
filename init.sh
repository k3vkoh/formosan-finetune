#!/bin/bash

# only need to run this once

python3 -m venv venv 
source venv/bin/activate

mkdir src 
cd src

git clone https://github.com/tesseract-ocr/tesstrain.git

cd tesstrain

gmake

gmake leptonica tesseract

git clone https://github.com/tesseract-ocr/tesseract.git
git clone https://github.com/tesseract-ocr/tessdata_best.git
git clone https://github.com/tesseract-ocr/langdata.git

mv tessdata_best/eng.traineddata tesseract/tessdata
mkdir tesstrain/data
mv langdata tesstrain/data/