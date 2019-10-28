# 临时笔记


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

------------------------------------------------------------------------------------------------
import numpy as np
import cv2

img = np.zeros([50,50,3],dtype=np.uint8)

sss=np.ones([50, 50, 1], dtype=np.uint8)
sss=sss*200

img[:, :, 0] = sss[:, :, 0]
img[:, :, 1] = sss[:, :, 0]
img[:, :, 2] = sss[:, :, 0]

img=cv2.normalize(img, None, 0, 255, cv2.NORM_MINMAX, cv2.CV_8U)

cv2.imshow('sss', img)
cv2.waitKey(0)

https://zhuanlan.zhihu.com/p/29567314

--------------------------------------------------------------------------------------------
给电脑装显卡驱动：

关掉securtiy boot mode
先设置密码，然后disable

去英伟达官网下驱动：
https://www.geforce.cn/drivers

ubunut查gpu显卡型号：

lspci | grep -i nvidia

GeForce MX150
64bit

sudo bash NVIDIA-Linux-x86_64-430.50.run

```bash
nvida-smi

sudo apt-get purge nvidia*
sudo apt-get --purge remove xserver-xorg-video-nouveau
sudo apt-cache search nvidia | grep -E "nvidia-[0-9]{3}"
sudo apt-get update
sudo apt-get install gcc make
chmod +x NVIDIA-Linux-x86_64-418.56.run
sudo ./NVIDIA-Linux-x86_64-418.56.run
sudo  shutdown -r now
nvidia-smi
```


NVIDIA-SMI has failed because it couldn’t communicate with the NVIDIA driver. Ma
ke sure that the latest NVIDIA driver is installed and running

遇到这个问题解决办法：
方法一：
cd /usr/src 查看驱动版本号(我的是410.93)

ls 查看你的驱动版本型号

  sudo apt-get install dkms
  sudo dkms install -m nvidia -v 410.93
  无需重启即可成功看到输入nvidia-smi后熟悉的界面

-------------------------------------------------------------------------------------------
好网站：

oldpan.me

whoiscaesarbao.com

------------------------------------------------------------------------------------------

heatmap定位：
http://b.edu.51cto.com/samsung/course/video?lessonId=237444
dsntnn:
https://zhuanlan.zhihu.com/p/53057942

网络结构：
https://baijiahao.baidu.com/s?id=1590362274035183205&wfr=spider&for=pc

-----------------------------------------------------------------------------------
## yolo笔记：
* 池化层容易丢失低层次的特征
* 调整卷积核的步幅来调整下采样的程度
* 上采样能帮助网络学习细粒度的特征
* https://github.com/eriklindernoren/PyTorch-YOLOv3
* https://github.com/jwchoi384/Gaussian_YOLOv3
* https://github.com/ayooshkathuria/YOLO_v3_tutorial_from_scratch
* https://github.com/shaoshengsong/MobileNetV3-SSD
* 


----------------------------------------------------------------------------------
```py
import time
import sys
import cv2
import numpy as np
import datetime
from PyQt5.QtCore import QObject, pyqtSignal, QThread, QTimer, Qt
from PyQt5.QtWidgets import (QProgressBar, QApplication, 
                            QPushButton, QDialog, 
                            QGridLayout, QMainWindow, 
                            QVBoxLayout, QWidget, 
                            QLabel)
from PyQt5.QtGui import QImage, QPixmap


srcHeight=480
srcWidth=480



class recoProcess(QObject):
    _signal = pyqtSignal(int)
    finished = pyqtSignal()

    def __init__(self):
        super(recoProcess, self).__init__()

    def run(self):
        for i in range(101):
            print(i)
            self._signal.emit(i)
            time.sleep(0.01)
        self.finished.emit()


class Video():
    def __init__(self, capture):
        self.capture = capture
        capture.set(3,srcWidth) # set Width
        capture.set(4,srcHeight) # set Height
        self.currentFrame = np.array([])
 
    def captureFrame(self):
        ret, readFrame = self.capture.read()
        return readFrame
 
    def captureNextFrame(self):
        ret, readFrame = self.capture.read()
        if (ret == True):
 
            # readFrame=cv2.resize(readFrame, (int(srcWidth / 4), int(srcHeight / 4)))
             
            #cv2.waitKey(1)
            self.currentFrame = cv2.cvtColor(readFrame, cv2.COLOR_BGR2RGB)
 
    def convertFrame(self):
        try:
            height, width = self.currentFrame.shape[:2]
            # print(height, width)
            img = QImage(self.currentFrame, width, height, QImage.Format_RGB888)
            img = QPixmap.fromImage(img)
            #self.previousFrame = self.currentFrame
            return img
        except:
            print('convertFrame error')
            return None





class CameraWin(QMainWindow):
    def __init__(self):
        super(CameraWin, self).__init__()

        self.init_ui()
 
    def init_ui(self):
        self.setWindowTitle('fingerReco')

        self.layout = QVBoxLayout()


        self.video = Video(cv2.VideoCapture(0))

        self.videoFrame = QLabel('VideoCapture')
        # self.videoFrame.setAlignment(Qt.AlignCenter)

        self.progress = QProgressBar(self)
        self.recoButton = QPushButton('识别', self)

        self.layout.addWidget(self.videoFrame)
        self.layout.addWidget(self.progress)
        self.layout.addWidget(self.recoButton)

        self.main_frame = QWidget()
        
        self.main_frame.setLayout(self.layout)

        self.recoButton.clicked.connect(self.recoButton_clicked)


        self._timer = QTimer(self)
        self._timer.timeout.connect(self.play)
        self._timer.start(2)
        self.update()

        
        self.setCentralWidget(self.main_frame)

        self.ret, self.capturedFrame = self.video.capture.read()

    def play(self):
        try:
            # nowTime=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            # print(nowTime)
            self.video.captureNextFrame()
            self.videoFrame.setPixmap(self.video.convertFrame())
            self.videoFrame.setScaledContents(True)
        except TypeError:
            print('No Frame')

    def recoButton_clicked(self):
        self.recoProcess_worker = recoProcess()
        self.recoProcessing_thread = QThread()
        self.recoProcess_worker.moveToThread(self.recoProcessing_thread)
        self.recoProcess_worker._signal.connect(self.progress.setValue)
        self.recoProcess_worker.finished.connect(self.recoProcess_worker_finished)
        self.recoProcessing_thread.started.connect(self.recoProcess_worker.run)
        self.recoProcessing_thread.start()

        self.recoButton.setEnabled(False)


    def recoProcess_worker_finished(self):
        self.recoProcessing_thread.quit()
        self.recoProcessing_thread.wait()
        self.recoButton.setEnabled(True)




if __name__ == '__main__':

    app = QApplication(sys.argv)
    win = CameraWin()
    win.show()
    app.exec_()
```
---------------------------------------------------------------------------
## centernet c++

* https://blog.csdn.net/u011681952/article/details/92765549

-----------------------------------------------------------------------------
## sd卡烧录后恢复容量

```bash
1、管理员方式启动cmd

2、输入  diskpart

3、list  disk   #查看当前有哪些磁盘

4、select disk 1 #选择第一个磁盘 （这里我的sd卡是 disk 1）

5、clean

6、create partition primary #创建磁盘分区

7、acitve #激活磁盘分区

8、format fs=fat32 quick #已fat32格式快速格式化磁盘分区
```
