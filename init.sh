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

cd ..

git clone https://github.com/tesseract-ocr/tesseract.git
git clone https://github.com/tesseract-ocr/tessdata_best.git
git clone https://github.com/tesseract-ocr/langdata.git

# using eng.traineddata since formosan languages are in roman characters
mv tessdata_best/eng.traineddata tesseract/tessdata
mkdir tesstrain/data
mv langdata tesstrain/data/

pip3 install -r requirements.txt

tar -xzvf example/favorlang-ground-truth
tar -xzvf example/favorlang-test

mv favorlang-ground-truth tesstrain/data/