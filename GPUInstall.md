# 安装anaconda建python虚拟环境

```bash

sh ~/Downloads/Anaconda3-XXXXXXXXX-Linux-x86_64.sh

conda create -n carAI python=3.6.8

```

# 安装GPU驱动

```bash

更新 or  安装驱动

# 查看已有驱动
cat /proc/driver/nvidia/version

# 检查最新驱动并推荐
ubuntu-drivers devices

# 自动安装驱动
sudo ubuntu-drivers autoinstall

# 查看是否有nouveau驱动
lsmod | grep nouveau
# 如果有输出表示没有仅用，需要禁用

# 如何有效的禁用 Ubuntu18.04的nouveau驱动
sudo nano /etc/modprobe.d/blacklist.conf

# 在最后两行添加：
blacklist nouveau

# 禁用nouveau的第三方驱动，之后也不需要改回来
options nouveau modeset=0


# 重启
sudo reboot

nvidia-smi

```


# 安装pytorch顺便安装cudatoolkit

```bash
conda install pytorch torchvision torchaudio cudatoolkit=10.1 -c pytorch

# 如果pytorch-1.8.1安装过程慢

# 下载地址
https://download.pytorch.org/whl/torch_stable.html
# 安装
pip install torch-1.8.1+cu101-cp36-cp36m-linux_x86_64.whl

```

# cudatoolkit_10.1版本兼容pytorch的较新版本，也兼容tensorflow-gpu_1.14.0，同时可替换原有的tenosrflow-gpu_1.8.0

```bash
pip install tensorflow-gpu==1.14.0

```

# python 依赖包

```bash

Package              Version
-------------------- -------------------
absl-py              0.13.0
astor                0.8.1
bleach               1.5.0
cached-property      1.5.2
certifi              2021.5.30
dataclasses          0.8
docopt               0.6.2
easydict             1.9
gast                 0.4.0
google-pasta         0.2.0
grpcio               1.38.0
h5py                 2.10.0
html5lib             0.9999999
importlib-metadata   4.5.0
Keras-Applications   1.0.8
Keras-Preprocessing  1.1.2
Markdown             3.3.4
numpy                1.19.5
olefile              0.46
opencv-python        4.5.2.54
pandas               1.1.5
Pillow               8.2.0
pip                  21.1.2
protobuf             3.17.3
PyQt5                5.12
PyQt5-Qt5            5.15.2
PyQt5-sip            4.19.19
python-dateutil      2.8.1
pytz                 2021.1
setuptools           52.0.0.post20210125
six                  1.16.0
tensorboard          1.14.0
tensorflow-estimator 1.14.0
tensorflow-gpu       1.14.0
termcolor            1.1.0
torch                1.4.0
torchaudio           0.4.0a0+719bcc7
torchvision          0.5.0
typing-extensions    3.10.0.0
Werkzeug             2.0.1
wheel                0.36.2
wrapt                1.12.1
zipp                 3.4.1

```

## 车如果要运行此训练机生成的模型需要做已下版本改动：
```bash

pip3 uninstall tensorflow==1.8.0
pip3 uninstall protobuf
pip3 uninstall h5py

pip3 install tensorflow==1.14.0
pip3 install protobuf
pip3 install h5py==2.10

```

## 命令行远程训练步骤：
```bash

# 1、从本地传送文件到服务器
# 将 /home 目录中的 a.jsp 文件从本地传送到服务器 /home 目录下
scp /home/a.jsp root@xxx.xxx.xxx.xxx:/home

# 2、从服务器下载文件到本地
# 将服务器的 /home 目录中的a.jsp文件下载到本地的/home目录
scp root@xxx.xxx.xxx.xxx:/home/a.jsp /home

# 3、从本地传送目录到服务器
# 将本地的 /home 中的 local_dir 目录传送到服务器的 /home 目录
scp -r /home/local_dir root@xxx.xxx.xxx.xxx:/home

# 4、从服务器下载目录到本地
# 将服务器的 /home 目录中的 dir 目录下载到本地的 /home 目录
scp -r root@192.168.0.101:/home/dir /home


# 训练指令

# ssh登录训练服务器, 用户名：uniwise,密码：123456
ssh uniwise@172.32.9.120

# 进入虚拟环境
conda activate carAI

# 进入训练文件夹目录
cd /home/uniwise/uniwise_train
# 训练模型111.h5
python manage.py --tub=./data --model=./output/111.h5
# 基于111.h5 迁移学习 训练模型 222.h5
python manage.py --tub=./data --model=./output/222.h5 --base_model=./output/111.h5


```
