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

usb 摄像头使用：

https://www.cnblogs.com/arkenstone/p/6872665.html

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


yolo数据集
https://www.kaggle.com/aruchomu/data-for-yolo-v3-kernel

c++ opencv win:
https://blog.csdn.net/zhaiax672/article/details/88971248

https://colab.research.google.com/drive/1mirG8BSoB3k87mh-qyY3-8-ZXj0XB6h6#scrollTo=Xh5cMw23YdaE
