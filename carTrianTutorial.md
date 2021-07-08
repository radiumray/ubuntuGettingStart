# 命令行远程训练步骤：
```bash

# 1、从本地传送文件到服务器
# 将 /home 目录中的 a.jsp 文件从本地传送到服务器 /home 目录下
scp /home/a.jsp root@xxx.xxx.xxx.xxx:/home

# 2、从服务器下载文件到本地
# 将服务器的 /home 目录中的a.jsp文件下载到本地的/home目录
scp root@xxx.xxx.xxx.xxx:/home/a.jsp /home

# 3、从本地传送目录到服务器
# 将本地的 /home 中的 local_dir 目录传送到服务器的 /home 目录
scp -r /home/local_dir root@xxx.xxx.xxx.xxx:/home

# 4、从服务器下载目录到本地
# 将服务器的 /home 目录中的 dir 目录下载到本地的 /home 目录
scp -r root@192.168.0.101:/home/dir /home


# 训练指令

# ssh登录训练服务器, 用户名：uniwise,密码：123456
ssh uniwise@172.32.9.120

# 进入虚拟环境
conda activate carAI

# 进入训练文件夹目录
cd /home/uniwise/uniwise_train
# 训练模型111.h5
python manage.py --tub=./data --model=./output/111.h5
# 基于111.h5 迁移学习 训练模型 222.h5
python manage.py --tub=./data --model=./output/222.h5 --base_model=./output/111.h5


```
