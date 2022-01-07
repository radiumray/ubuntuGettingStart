

```bash

# 安装anaconda，配置conda的源
https://github.com/radiumray/ubuntuGettingStart/blob/master/init.md

# conda 找不到指令
ubuntu18.4 安装anaconda时conda：未找到命令(有坑)

第一步：sudo 时赋予当前账户root权限（可以修改系统文件），gedit是一个编辑器，可以换成别的编辑器，如gvim

sudo gedit ~/.bashrc

第二步：添加到最后即可

export PATH="/home/zm/anaconda3/bin:$PATH"

第三步：更新.bashrc文件

source ~/.bashrc




# pip list
https://github.com/radiumray/uniwiseRosCar/blob/main/pipList.md



# git生成密钥
https://github.com/radiumray/ubuntuGettingStart/blob/master/git.md


pip install tensorflow==1.14.0


# ERROR: Cannot uninstall 'wrapt'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.

pip install -U --ignore-installed wrapt


conda search torch

pip install torch==1.8.1 torchvision==0.9.1




# supervisor

https://github.com/radiumray/ubuntuGettingStart/blob/master/supervisor.md


# nomachine 安装
sudo dpkg -i nomachine_7.6.2_4_amd64.deb

# vscode 安装

# arduino 与相关库安装

# cutecom 安装
sudo apt-get install cutecom

# systemback 安装

1.要在Ubuntu 18.04或Ubuntu 18.10系统上安装systemback，首先删除PPA：
sudo add-apt-repository --remove ppa:nemh/systemback

2.然后导入此PPA的GPG签名密钥，以便包管理器可以验证签名，签名密钥可以在launchpad.net上找到：
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 382003C2C8B7B4AB813E915B14E4942973C62A1B

在Ubuntu16.04的Systemback binary包可以兼容Ubuntu18.04，因此，可以将Ubuntu16.04的PPA添加到系统。
sudo add-apt-repository "deb http://ppa.launchpad.net/nemh/systemback/ubuntu xenial main"

3.然后更新源并安装：
sudo apt update
sudo apt install systemback



```
