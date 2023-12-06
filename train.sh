#!/bin/bash

# default = yami
# favorlang is also ready to be trained
# change to your model
modelName='yami'

cd src/tesstrain

TESSDATA_PREFIX=../tesseract/tessdata gmake training MODEL_NAME=$modelName START_MODEL=eng TESSDATA=../tesseract/tessdata MAX_ITERATIONS=1000 

mv data/$modelName.traineddata /usr/local/share/tessdata/
