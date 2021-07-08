# 命令行远程训练步骤：
```bash

# 车采集完的数据最好压缩成zip文件

# 从本地传送文件到服务器
# 将 /home 目录中的 data1.zip 文件从本地传送到服务器 /home 目录下
scp /home/data.zip uniwise@xxx.xxx.xxx.xxx:/home/uniwise/uniwise_train


# 解压data1.zip 用于之后的训练


# 训练指令

# ssh登录训练服务器, 用户名：uniwise,密码：123456
ssh uniwise@xxx.xxx.xxx.xxx

# 进入虚拟环境
conda activate carAI

# 进入训练文件夹目录
cd /home/uniwise/uniwise_train
# 训练模型111.h5
python manage.py --tub=./data1 --model=./output/111.h5
# 基于111.h5 迁移学习 训练模型 222.h5
python manage.py --tub=./data1 --model=./output/222.h5 --base_model=./output/111.h5



# 从服务器下载文件到本地
# 将服务器的 /home 目录中的111.h5文件下载到本地的/home目录
scp uniwise@xxx.xxx.xxx.xxx:/home/uniwise/uniwise_train/output/111.h5 /home

```
