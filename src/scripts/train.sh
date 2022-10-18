#!/bin/bash
conda activate pytorch
cd ./yolov7
num_freeze_layers = 118
batch_size = 16
num_epochs = 10
data_name = "VisDroneData-2019"
weight_filename = "yolov7x_training.pt"
cfg_filename = "yolov7x.yaml"
# python3 train.py --freeze 74 --batch 16 --epochs 5 --data ../VisDrone/VisDroneData-2019/data.yaml --weights 'yolov7-tiny.pt' --device 0 --cfg ./cfg/training/yolov7-tiny.yaml
# python3 train.py --freeze 102 --batch 16 --epochs 5 --data ../VisDrone/VisDroneData-2019/data.yaml --weights 'yolov7_training.pt' --device 0 --cfg ./cfg/training/yolov7.yaml
if [! -f yolov7x_training.pt]
then
    wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7x_training.pt
else
    echo "yolov7x_training.pt file already exists"
fi
python3 train.py --freeze $num_freeze_layers --batch $batch_size --epochs $num_epochs --data ../VisDrone/$data_name/data.yaml --weights $weight_filename --device 0 --cfg ./cfg/training/$cfg_filename