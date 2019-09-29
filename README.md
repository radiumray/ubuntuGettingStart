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

------------------------------------------------------------------------------------------------
import numpy as np
import cv2

img = np.zeros([50,50,3],dtype=np.uint8)

sss=np.ones([50, 50, 1], dtype=np.uint8)
sss=sss*200

img[:, :, 0] = sss[:, :, 0]
img[:, :, 1] = sss[:, :, 0]
img[:, :, 2] = sss[:, :, 0]

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

import pandas as pd


def initData():
    df=pd.DataFrame({'imageName':['111.jpg', '222.jpg', '333.jpg', '444.jpg'], 
                    'x':[11.2,22.2,33.2,44.2],
                    'y':[22.2,33.2,44.2,55.2]
                    }, dtype='float')

    dfTest=pd.DataFrame({'Names': ['Pete', 'Jordan', 'Gustaf',
                            'Sophie', 'Sally', 'Simone'],
                    'Age':[22, 21, 19, 19, 29, 21]})

    dfs = {'imageLable':df, 'test':dfTest}

    # df.to_excel('pandasExel.xlsx', sheet_name='imageLable', index=False)
    writer = pd.ExcelWriter('pandasExel.xlsx', engine='xlsxwriter')

    for sheet_name in dfs.keys():
        dfs[sheet_name].to_excel(writer, sheet_name=sheet_name, index=False)

    writer.save()

# initData()


def searchIndexByColName(excelName, sheetName, colName, keyWord):
    df = pd.read_excel(excelName, sheet_name=sheetName)
    value=df.loc[df[colName] == keyWord]
    if(value.empty):
        return -1
    else:
        # print('x:',value['x'].values[0])
        return value.index.values[0]

# index=searchIndexByColName('pandasExel.xlsx', 'imageLable', 'imageName', '444.jpg')
# print('index:', index)

def updateXYByColName(excelName, sheetName, colName, keyWord, x, y):
    df = pd.read_excel(excelName, sheet_name=sheetName)
    value=df.loc[df[colName] == keyWord]
    if(value.empty):
        print('add row at end')
        new=pd.DataFrame({'imageName':keyWord, 
                'x':x,
                'y':y
                }, index=[4])


        df=df.append(new,ignore_index=True)
        df.to_excel(excelName, sheet_name=sheetName)

    else:
        print('update x y')
        index=value.index.values[0]
        df.at[index,'x']=x
        df.at[index,'y']=y
        print(df)
        df.to_excel(excelName, sheet_name=sheetName)
        # writer = pd.ExcelWriter(excelName, engine='xlsxwriter')
        # writer.save
        # new_column = pd.Series(['d', 'e'], name='B', index=[0, 2])
        # df.update(new_column)
        # print('x:',value['x'].values[0])
        # return value.index.values[0]


updateXYByColName('pandasExel.xlsx', 'imageLable', 'imageName', '555.jpg', 1.1, 2.2)


# df.drop([0]) #delet first row
