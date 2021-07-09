

# 通过豆瓣镜像pip install
pip install netron -i https://pypi.douban.com/simple


# openvino安装：
```bash

# intel 官网教程链接：
https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_linux.html

# 从官网下载OpenVINO的安装包，选择Linux的安装包
https://software.intel.com/en-us/openvino-toolkit/choose-download



# 打开终端切到下载压缩包的目录，解压
tar -xvzf l_openvino_toolkit_p_<version>.tgz

# 转到解压文件目录下
cd l_openvino_toolkit_p_<version>

# 选择安装选项 推荐GUI安装
sudo ./install_GUI.sh

# 跟随出现的窗口一步步安装，安装选择next,至此第一部分安装完成
# 下面开始安装依赖的软件
# 转到openvino的安装目录下的文件夹 结合自己上一步的安装情况选择下面的命令

cd  /opt/intel/openvino/install_dependencies
# 或
cd ~/intel/openvino/install_dependencies

# 执行下面的命令安装
sudo -E ./install_openvino_dependencies.sh

# 设置环境变量
# 一次性命令：

source /opt/intel/openvino/bin/setupvars.sh
# 或
source ~/intel/openvino/bin/setupvars.sh

# 永久命令：
# 在用户目录下打开.bashrc 文件
vi <user_directory>/.bashrc

# 添加以下代码到文件的最后

source /opt/intel/openvino/bin/setupvars.sh
# 或
source ~/intel/openvino/bin/setupvars.sh


# 模型优化配置步骤
cd /opt/intel/openvino/deployment_tools/model_optimizer/install_prerequisites

sudo ./install_prerequisites.sh

# 运行代码验证安装是否成功
cd /opt/intel/openvino/deployment_tools/demo

./demo_squeezenet_download_convert_run.sh

./demo_security_barrier_camera.sh


```
