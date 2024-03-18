# CUDA_VISIBLE_DEVICES=0 python3 -u main.py\
#  --fraction 0.1 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 5 --workers 10 --optimizer SGD\
#      -se 10 --selection Glister --model InceptionV3\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 50

# CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
#  --fraction 0.1 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 1 --selection GraNd --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 1

CUDA_VISIBLE_DEVICES=0,1 python3 -u main.py\
 --fraction 0.1 --dataset CIFAR10 --data_path ~/datasets\
    --num_exp 1 --workers 10 --optimizer SGD\
     -se 10 --selection Uniform --model ResNet18\
      --lr 0.1 --save_path ./result --batch 128\
      --epochs 1