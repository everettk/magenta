# Copyright 2019 The Magenta Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

set -x
set -e

# Change this to directory where you want to save experiment logs:
logdir=/Users/keverett/dev/bach-generator/magenta/magenta/models/coconet/logs
# Change this to directory where data is loaded from:
data_dir=/Users/keverett/dev/bach-generator/magenta/magenta/models/coconet/traindata
# Change this to your dataset class, which can be defined in lib_data.py.
dataset=Jsb16thSeparated

# Data preprocessing.
crop_piece_len=128
separate_instruments=True
quantization_level=0.125  # 16th notes

# Hyperparameters.
maskout_method=orderless
num_layers=64
num_filters=128
batch_size=10
architecture='straight'


# Run command.
python coconet_train.py \
  --logdir=$logdir \
  --log_progress=True \
  --data_dir=$data_dir \
  --dataset=$dataset \
  --crop_piece_len=$crop_piece_len \
  --separate_instruments=$separate_instruments \
  --quantization_level=$quantization_level \
  --maskout_method=$maskout_method \
  --num_layers=$num_layers \
  --num_filters=$num_filters \
  --use_residual \
  --batch_size=$batch_size \
  --architecture=$architecture
