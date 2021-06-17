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

待更新...

```
