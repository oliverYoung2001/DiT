#!/bin/bash
source ~/env.sh
spack load cuda@12.1.1%gcc@12.2.0
conda activate mg

# export http_proxy="http://127.0.0.1:8901"
# export https_proxy="http://127.0.0.1:8901"

# export http_proxy="http://nico0:8901"
# export https_proxy="http://nico0:8901"

# unset http_proxy
# unset https_proxy

# nico0: 127.23.18.10
# nico2: 127.23.18.2