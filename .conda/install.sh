#!/bin/bash
set -ex

CONDA_INSTALLATION_PATH=/tmp/anaconda
export PATH=$CONDA_INSTALLATION_PATH/bin:$PATH

if hash conda 2>/dev/null; then
    echo "Conda already installed"
else
    echo "Installing Conda"
    curl -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
    bash Miniconda2-latest-Linux-x86_64.sh -b -p $CONDA_INSTALLATION_PATH/anaconda || echo "Conda already installed"
fi

find $CONDA_INSTALLATION_PATH -maxdepth 2
which conda

if hash conda 2>/dev/null; then
    echo "Conda build already installed"
else
    echo "Installing conda-build"
    conda install -y conda-build
fi