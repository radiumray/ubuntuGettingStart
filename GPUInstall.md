# 安装anaconda建python虚拟环境
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
