#!/bin/bash
conda activate pytorch
cd ./yolov7
# python3 train.py --freeze 74 --batch 16 --epochs 5 --data ../VisDrone/VisDroneData-2019/data.yaml --weights 'yolov7-tiny.pt' --device 0 --cfg ./cfg/training/yolov7-tiny.yaml
# python3 train.py --freeze 102 --batch 16 --epochs 5 --data ../VisDrone/VisDroneData-2019/data.yaml --weights 'yolov7_training.pt' --device 0 --cfg ./cfg/training/yolov7.yaml
python3 train.py --freeze 118 --batch 16 --epochs 5 --data ../VisDrone/VisDroneData-2019/data.yaml --weights 'yolov7x_training.pt' --device 0 --cfg ./cfg/training/yolov7x.yaml