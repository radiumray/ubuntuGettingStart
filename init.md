## 查看linux版本

cat /proc/version

``` bash
Linux version 3.10.0-514.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-11) (GCC) ) #1 SMP Tue Nov 22 16:42:41 UTC 2016
```

uname -a

``` bash
Linux host999999 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```

cat /etc/issue





https://mirrors.tuna.tsinghua.edu.cn/help/debian/




``` bash

cd /etc/apt
cp sources.list sources.list.bak

rm sources.list
touch sources.list

echo '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> sources.list

apt-get update

```




一般情况下，condarc文件出现在/home/user目录下，但有时会出现找不到情况，解决办法如下：

创建condarc文件命令

conda config --add channels r

即在/home/user目录下出现.condarc文件


https://mirror.tuna.tsinghua.edu.cn/help/anaconda/


pip install torch==1.8.0 torchvision==0.9.0 -i http://mirrors.aliyun.com/pypi/simple/

