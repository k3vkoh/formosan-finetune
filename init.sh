#!/bin/bash

# only need to run this once

python3 -m venv venv 
source venv/bin/activate

mkdir src 

# proj/src
cd src

git clone https://github.com/tesseract-ocr/tesstrain.git

# proj/src/tesstrain
cd tesstrain

gmake

gmake leptonica tesseract

# proj/src
cd ..

git clone https://github.com/tesseract-ocr/tesseract.git
git clone https://github.com/tesseract-ocr/tessdata_best.git
git clone https://github.com/tesseract-ocr/langdata.git

# using eng.traineddata since formosan languages are in roman characters
mv tessdata_best/eng.traineddata tesseract/tessdata
mkdir tesstrain/data
mv langdata tesstrain/data/

# proj/
cd ..

pip3 install -r requirements.txt

tar -xzvf example/favorlang-ground-truth.tgz
tar -xzvf example/favorlang-test.tgz

tar -xzvf example/yami-ground-truth.tgz

mv favorlang-ground-truth src/tesstrain/data/
mv yami-ground-truth src/tesstrain/data/