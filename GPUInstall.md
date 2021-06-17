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

```

# cudatoolkit_10.1版本兼容pytorch的较新版本，也兼容tensorflow-gpu_1.14.0，同时可替换原有的tenosrflow-gpu_1.8.0

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
gast                 0.4.0
google-pasta         0.2.0
grpcio               1.38.0
h5py                 3.1.0
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
