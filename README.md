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



```py
import cv2
import numpy as np
import time
import sys

from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *

class Camera:
    def __init__(self, width=320, height=240):
        self.cap=cv2.VideoCapture(0)
        self.image=QImage()
        self.width=width
        self.height=height
        ret, frame = self.cap.read()
        frame = cv2.resize(frame, (self.width, self.height))
        self.h, self.w, self.bytesPerComponent = frame.shape
        self.bytesPerLine = self.bytesPerComponent * self.w
    
    def ReturnOneQPixmap(self):
        # get a frame
        ret, frame = self.cap.read()
        frame = cv2.resize(frame, (self.width, self.height))
        if ret:
            if frame.ndim ==3:
                rgb=cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            elif frame.ndim ==2:
                rgb=cv2.cvtColor(frame, cv2.COLOR_GRAY2BGR)
        self.image = QImage(rgb.data, self.w, self.h, self.bytesPerLine, QImage.Format_RGB888)    
        return QPixmap.fromImage(self.image)
    
    def DestroyCamera(self):
        cap.release()
        cv2.destroyAllWindows()


class VideoBox(QWidget):
    def __init__(self):
        QWidget.__init__(self)
        self.setWindowFlags(Qt.CustomizeWindowHint)
        self.camera = Camera(320, 320)
        self.pictureLabel = QLabel()
        self.pictureLabel.setFixedSize(320, 240)
        self.pictureLabel.setObjectName("Camera")
        self.combo = QComboBox()
        self.combo.addItem('Video')
        self.combo.addItem('Stop')
        self.combo.activated[str].connect(self.onActivatd)
        control_box = QHBoxLayout()
        control_box.setContentsMargins(0, 0, 0, 0)
        control_box.addWidget(self.combo)
        layout = QVBoxLayout()
        layout.addWidget(self.pictureLabel)
        layout.addLayout(control_box)
        self.setLayout(layout)
        self.video_timer = VideoTimer()
        self.video_timer.timeSignal.signal[str].connect(self.showframe)

    def onActivatd(self, text):
        if text == 'Video':
            self.video_timer.start()
            print('Video')
        if text == 'Stop':
            self.video_timer.stop()
            quit()

    def showframe(self):
        self.pictureLabel.setPixmap(self.camera.ReturnOneQPixmap())

class Communicate(QObject):
    signal = pyqtSignal(str)

class VideoTimer(QThread):
    def __init__(self, frequent=20):
        QThread.__init__(self)
        self.stopped = False
        self.frequent = frequent
        self.timeSignal = Communicate()
        self.mutex = QMutex()

    def run(self):
        with QMutexLocker(self.mutex):
            self.stopped = False
        while True:
            if self.stopped:
                return
            self.timeSignal.signal.emit("1")
            time.sleep(1 / self.frequent)

    def stop(self):
        with QMutexLocker(self.mutex):
            self.stopped = True

    def is_stopped(self):
        with QMutexLocker(self.mutex):
            return self.stopped

    def set_fps(self, fps):
        self.frequent = fps

if __name__ == "__main__":
    app = QApplication(sys.argv)
    box = VideoBox()
    # box.showFullScreen()
    box.show()
    sys.exit(app.exec_())


```
