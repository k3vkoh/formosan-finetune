#!/bin/bash

modelName='favorlang'

cd src/tesstrain

TESSDATA_PREFIX=../tesseract/tessdata gmake training MODEL_NAME=$modelName START_MODEL=eng TESSDATA=../tesseract/tessdata MAX_ITERATIONS=1000 

mv data/$modelName.traineddata /usr/local/share/tessdata/
