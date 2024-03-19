#!/bin/bash

export PARTITION=octave
export HOST=octave
export CLUSTER_NAME=yes
export MASTER_ADDR=localhost
export NNODES=1
export GPUS_PER_NODE=1

export MASTER_PORT=$((RANDOM % 12000 + 10000))
export WORLD_SIZE=$(($GPUS_PER_NODE*$NNODES))

EXECUBLE=./scripts/train.sh


SLURM_ARGS="
-p $PARTITION \
-w $HOST \
--ntasks-per-node=1 \
--gres=gpu:$GPUS_PER_NODE \
-K \
"

# echo "SLURM_ARGS: $SLURM_ARGS"
# export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
# export CUDA_VISIBLE_DEVICES=0,2,3,1,6,4,5,7
srun $SLURM_ARGS \
$EXECUBLE $MASTER_ADDR $MASTER_PORT $NNODES $GPUS_PER_NODE
