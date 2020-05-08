#!/bin/bash

echo "Privide sudo for package dependency install "
sudo echo "Privileged" || privileged=true
if [ ! -d work ]; then
  # make work directory
  mkdir work
fi

cd work

if [ ! -d tensorflow ]; then
  # clone TensorFlow
  git clone --depth 10 https://github.com/tensorflow/tensorflow.git tensorflow
fi

cd tensorflow

if [ -z $privileged ]; then
sudo apt install -y python3-numpy build-essential
fi

BUILD_DEB=y
TENSORFLOW_TARGET=rpi
if [ -z $privileged ]; then
sudo ./tensorflow/lite/tools/make/download_dependencies.sh
sudo ./tensorflow/lite/tools/make/build_rpi_lib.sh
sudo ./tensorflow/lite/tools/pip_package/build_pip_package.sh
fi
