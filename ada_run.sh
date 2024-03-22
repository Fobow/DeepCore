# CUDA_VISIBLE_DEVICES=0,1 python3 -u ada_main.py\
#  --fraction 0.2 --dataset CIFAR10 --data_path ~/datasets\
#     --num_exp 1 --workers 10 --optimizer SGD\
#      -se 10 --selection AdaGraNd --model ResNet18\
#       --lr 0.1 --save_path ./result --batch 128\
#       --epochs 100


fractions="0.2 0.4 0.5 0.6 0.8"
# fractions="0.4 0.5 0.6 0.8"
selections="AdaUniform"
# selections="GraNd"

for i in 1; do
    # Iterate over fractions
    for fraction in $fractions; do
        # Iterate over selections
        for selection in $selections; do
            # Run your command with the current values of --fraction and --selection
            CUDA_VISIBLE_DEVICES=0,1 python3 -u ada_main.py \
            --fraction "$fraction" \
            --select_every 20 \
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