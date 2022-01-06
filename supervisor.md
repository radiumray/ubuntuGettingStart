
```bash

sudo apt-get install supervisor

cd /etc/supervisor/

cd conf.d

sudo nano uniwiseRosCar.conf


; 设置进程的名称，使用 supervisorctl 来管理进程时需要使用该进程名
[program:uniwiseRosCarTask]
; 使用venv下的Python去启动脚本
command=/home/uw/anaconda3/bin/python ipDetectReport.py
; 进入哪个目录执行command
directory=/home/uw/uniwiseRosCar/ray
user=uw
numprocs=1
autostart=true
autorestart=false
; logs目录提前创建好
stdout_logfile=/home/uw/cron_tasks/logs/supervisor-out.log
stdout_logfile_backups=10
; 错误日志记得输出，这样启动如果报错容易看出来
stderr_logfile=/home/uw/cron_tasks/logs/supervisor-error.log
redirct_stderr=true
startsecs=1
stopasgroup=true




```


```bash

sudo supervisorctl update        //配置文件修改后使用该命令加载新的配置
sudo supervisorctl reload        //重新启动配置中的所有程序
sudo supervisorctl status        //查看所有进程的状态
sudo supervisorctl stop xxxxx       //停止xxxxx
sudo supervisorctl start xxxxx      //启动xxxxx
sudo supervisorctl restart       //重启es


```

