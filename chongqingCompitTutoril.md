# 比赛使用文档

## 1：生成自动驾驶模型工具：在小车桌面上有LRUI的图标，点击打开

## 2：数据采集：点击 [LR驾驶] 按钮, 会看到 采集数据 字样 旁边有一个 [启动] 按钮，点击后就可以采集数据了，数据会存到LR_tookit/data文件夹里
![collect data](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/dataCollect.png)

## 3：训练：点击 [LR训练] 按钮，选择数据文件夹LR_tookit/data，给你的模型命名，点击 [开始训练] 按钮后开始训练，此时保证NUC有独立电源供电，尽量不用电池供电，训练完后会在LR_tookit/output文件夹里生成你的xxx.h5模型。本次比赛只用到工具中的这两个功能生成模型，其它功能不在本次比赛中使用。
![train0](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/trian0.png)

![train1](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/train1.png)

![train2](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/train2.png)


## 4：转移模型到比赛：把LR_toolkit/output生成的xxx.h5模型放到compitCar/output中去

## 5：使用 mixly软件，拖拽图形块，定义遇到标识牌后的行为，上传mixly.py文件到小车(名称不得修改)，远程启动看效果，调整图形块中的参数，直到效果满意为止。

![mixly0](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/mixly0.png)

![mixly1](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/mixly1.png)

![mixly2](https://github.com/radiumray/ubuntuGettingStart/blob/master/images/mixly2.png)
