#!/bin/bash

if [ ! -d work ]; then
  # make work directory
  mkdir work
fi

cd work

if [ ! -d tensorflow ]; then
  # clone TensorFlow
  git clone https://github.com/tensorflow/tensorflow.git tensorflow
fi

cd tensorflow


