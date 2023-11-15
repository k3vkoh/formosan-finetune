# formosan-finetune

## Initialize

To initialize the project, run
``` bash
bash init.sh
```

## Data Collection

To train your own model, you will need to create a folder called <language>-ground-truth. Inside this folder include .png file in the format: <language>-<index>.png. Example: favorlang-1.png. Then, create the text for that image in a .txt named in the following format: <language>-<index>.gt.txt. Example: favorlang-1.gt.txt. Now, run
``` bash
bash prep.sh
```

## Train

To train the model, edit the model name in train.sh. Then, run

```bash 
bash train.sh
```

## Test

To test the model, add the folder path to you test data and the language of choice in main.py. Then, run

```bash
python main.py
```