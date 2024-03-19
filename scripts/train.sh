#!/bin/bash

# Node Config
export MASTER_ADDR=$1
export MASTER_PORT=$2
export NNODES=$3
export GPUS_PER_NODE=$4
export NODE_RANK=$SLURM_NODEID

# echo "NNODES: $NNODES"
echo "NODEID: $SLURM_NODEID"
echo "GPUS_PER_NODE: $GPUS_PER_NODE"
echo "WORLD_SIZE: $WORLD_SIZE"

DISTRIBUTED_ARGS="
    --nproc_per_node $GPUS_PER_NODE \
    --nnodes $NNODES \
    --node_rank $NODE_RANK \
    --master_addr $MASTER_ADDR \
    --master_port $MASTER_PORT
"

# export TORCH_USE_CUDA_DSA=1     # [NOTE]: enable device-side assertions
# export CUDA_LAUNCH_BLOCKING=1   # [NOTE]: for profiling or debug
# export CUDA_DEVICE_MAX_CONNECTIONS=1
torchrun $DISTRIBUTED_ARGS train.py \
    --data-path \
    --model DiT-XL/2 \
    --image-size 256 \
    --tokenizer /home/dataset/Dit/TOKENIZERS/sd-vae-ft-mse \
    --results-dir ./results \
    --epochs 1 \
    --global-seed 1 \

