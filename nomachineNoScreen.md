

```bash
# 客户端和serv端都安装好以后，跟连接VNC用法类似。
# 但是这里遇到一个问题，在服务端没接显示器的情况下，客户端看到的是黑屏（我这里服务器是ubuntu18.04）。
# 解决办法是：
sudo service gdm3 stop
sudo init 3
sudo /etc/NX/nxserver --restart

# 这样就OK了。
# 另外每次都需要手动输入这几行命令，比较麻烦，可以写一个开机启动的server。
# 在etc/systemd/system/路径下创建一个myboot.service文件

[Unit]
After=sshd.service

[Service]
ExecStart=/home/pi/tony-bootup.sh

[Install]
WanteBy=default.target


# After是什么时候启动这个服务，这里是在启动完sshd.service后启动
# Service是要启动的脚本，想做哪些动作都可以自己实现

sudo chmod 777 /etc/systemd/system/myboot.service
sudo systemctl daemon-reload
sudo systemctl enable myboot.service

# 如果想测试下这个服务，敲下面的命令
sudo systemctl start myboot.service



# 卸载
sudo dpkg -r nomachine
