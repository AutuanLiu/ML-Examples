#!/usr/bin/env bash

# 用于 Ubuntu 环境配置, 当然可以用于配置 云服务器环境
# 参考我的另一个库 https://github.com/AutuanLiu/ML-Docker-Env
# autuanliu@163.com
# status: ubuntu 16.04 测试 pass
# 请给予 sudo 权限, 复制 pip_pkg.txt 文件到同一目录
# chmod +x env_configure.sh
# sudo ./env_configure.sh

# MiniConda install
export PATH=/opt/conda/bin:$PATH > /etc/profile.d/conda.sh &&
wget -nv https://repo.continuum.io/miniconda/Miniconda3-4.3.27-Linux-x86_64.sh -O ~/anaconda.sh &&
/bin/bash ~/anaconda.sh -b -p /opt/conda && rm ~/anaconda.sh &&

# channel set
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ &&
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ &&
conda config --set show_channel_urls yes &&

# pip3 install
python3 -m pip install --upgrade pip &&

# opencv
apt-get -qq install -y libsm6 libxext6 && pip3 install -q -U opencv-python &&

# graphviz
apt-get -qq install -y graphviz && pip3 install -q pydot &&

# conda pkgs install
conda install -y pillow scipy &&

# xgboost
conda install -y -c conda-forge xgboost &&

# pytorch
conda install -y -c pytorch pytorch &&

# R
conda config --system --append channels r &&
conda install -y rpy2=2.8* r-base=3.3.2 r-irkernel=0.7* r-plyr=1.8* r-devtools=1.12* r-tidyverse=1.0* &&
conda install -y r-shiny=0.14* r-rmarkdown=1.2* r-forecast=7.3* r-rsqlite=1.1* r-reshape2=1.4* &&
conda install -y r-nycflights13=0.2* r-caret=6.0* r-rcurl=1.95* r-crayon=1.3* r-randomforest=4.6* &&
conda clean -tipsy &&

# pip pkgs install
pip3 install -r pip_pkgs.txt &&

# jupyter notebook
python3 -m pip install jupyter
