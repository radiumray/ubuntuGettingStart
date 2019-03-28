# ubuntuGettingStart
ubuntu上手说明


## 1:进bios设置u盘启动安装ubuntu

## 2: 修改为清华镜像源:

如果不修改镜像源就装不上任何工具，除非你在国外

https://mirrors.tuna.tsinghua.edu.cn/help/raspbian/

`sudo apt-get update`

## 3:安装opencv：

`pip install opencv-python`

opencv的 HSV 色域识别：

https://blog.csdn.net/beizhengren/article/details/78354896

## 4:安装串口：

`pip install pyserial`

https://blog.csdn.net/as472780551/article/details/79126927


## 5:安装openssh:

``sudo apt-get install openssh-server``

``sudo /etc/init.d/ssh stop``

``sudo /etc/init.d/ssh start``

## 6:配置免密码：

https://www.linuxidc.com/Linux/2016-12/139018.htm

``sudo visudo``

## 7：开机自动启动：

https://blog.csdn.net/time_future/article/details/85805298

`sudo nano /etc/profile`

最下边添加：

`python3 ~/carTest/showIP.py &`

## 8:机器人各种算法：

https://atsushisakai.github.io/PythonRobotics/

