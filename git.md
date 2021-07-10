```bash


1）、重新生成ssh
ssh-keygen -t rsa -C “xxxxx@xxxxx.com”
2）、查看你的 public key
cat ~/.ssh/id_rsa.pub
（以ssh-rsa 开头，以账号的注册邮箱结尾的）
3）、将它添加到码云
4）、终端输入
ssh -T git@gitee.com
5）、完成啦~

```
