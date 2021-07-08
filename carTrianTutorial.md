# 命令行远程训练步骤：
```bash

# 车采集完的数据最好压缩成zip文件

# 1、从本地传送文件到服务器
# 将 /home 目录中的 data.zip 文件从本地传送到服务器 /home 目录下
scp /home/data.zip root@xxx.xxx.xxx.xxx:/home


# 2、解压data.zip


# 3、从服务器下载文件到本地
# 将服务器的 /home 目录中的111.h5文件下载到本地的/home目录
scp root@xxx.xxx.xxx.xxx:/home/111.h5 /home



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
