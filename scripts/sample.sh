#!/bin/bash
PARTITION=octave
HOST=octave
CLUSTER_NAME=yes
GPUS_PER_NODE=1
NTASKS_PER_NODE=$GPUS_PER_NODE

EXECUBLE=sample.py

mkdir -p ./tmp

srun --ntasks-per-node $NTASKS_PER_NODE --gres=gpu:$GPUS_PER_NODE -K \
python $EXECUBLE \
    --model DiT-XL/2 \
    --image-size 256 \
    --seed 1 \
    --tokenizer /home/dataset/Dit/TOKENIZERS/sd-vae-ft-mse \
    --ckpt /home/dataset/Dit/DiT-XL-2-256x256.pt \
