# CUDA_VISIBLE_DEVICES=0 python3 -u main.py\
#  --fraction 0.1 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 5 --workers 10 --optimizer SGD\
#      -se 10 --selection Glister --model InceptionV3\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 50

# CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
#  --fraction 0.2 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 10 --selection GraNd --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 100

# CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
#  --fraction 0.6 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 10 --selection GraNd --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 100

# CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
#  --fraction 0.2 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 10 --selection Full --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 100

# CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
#  --fraction 0.2 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 10 --selection Full --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 100

#!/bin/bash

# Define the values for --fraction and --selection
fractions="0.2 0.4 0.5 0.6 0.8"
# fractions="0.4 0.5 0.6 0.8"
selections="GraNd Uniform"
# selections="GraNd"

for i in 1 2 3; do
    # Iterate over fractions
    for fraction in $fractions; do
        # Iterate over selections
        for selection in $selections; do
            # Run your command with the current values of --fraction and --selection
            CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py \
            --fraction "$fraction" \
            --dataset CIFAR10 \
            --data_path ~/datasets \
            --num_exp 1 \
            --workers 10 \
            --optimizer SGD \
            -se 10 \
            --selection "$selection" \
            --model ResNet18 \
            --lr 0.1 \
            --save_path ./result \
            --batch 128 \
            --epochs 100 \
            --scheduler CosineAnnealingLR
        done
    done
done