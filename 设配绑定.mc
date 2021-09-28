# 设备绑定


```bash

ls /dev/tty*


/dev/ttyACM0


udevadm info -a /dev/ttyACM0

udevadm info --attribute-walk --name=/dev/ttyACM0


sudo nano /etc/udev/rules.d/xxx-device.rules

>>>

KERNEL=="ttyACM*", SUBSYSTEMS="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0043", KERNELS="1-2", NAME="ttyACM0", SYMLINK+="rayDeviceXXXXX"


ls -l /dev/rayDevice*

```


```py

	def begin_bind(self):
		dev_list2 = []
		[dev_list2.append(i) for i in os.popen('ls /dev/video*')]
		if len(dev_list2) != 0:
			if self.lbl_name1.text() == 'wideAngle' or self.lbl_name1.text() == 'normal':
				if len(dev_list2) == 1:
					self.binding_fun(0,self.lbl_name1.text())
				elif len(dev_list2) == 2:
					if os.path.exists('/etc/udev/rules.d/cam.rules'):
						pass
					else:
						os.system('echo mc.123 | sudo -S touch /etc/udev/rules.d/cam.rules')
						time.sleep(0.5)
					os.system('echo mc.123 | sudo -S chmod 777 /etc/udev/rules.d/cam.rules')
					time.sleep(0.5)
					with open("/etc/udev/rules.d/cam.rules","w") as f:
						f.truncate() #清空之前内容
					self.binding_fun(0,self.lbl_name1.text(),append_mode=True)
					self.binding_fun(1,self.lbl_name2.text(),append_mode=True)
				#绑定完之后释放cap
				self.video1.cap.release()
				self.video2.cap.release()
				self.lbl_frame1.setText('<html><head/><body><p align="center">未发现此摄像头</p></body></html>')
				self.lbl_frame2.setText('<html><head/><body><p align="center">未发现此摄像头</p></body></html>')
				self.widget.close()
				self.lbl_name1.setText('未命名')
				self.lbl_name2.setText('未命名')
				self.btn_open.setEnabled(True)
				QMessageBox.warning(self, '信息', '绑定成功，请重新拔插摄像头，使设置生效', QMessageBox.Yes )
			else:
				infoBox = QMessageBox(self)
				infoBox.setWindowTitle("提示")
				infoBox.setIcon(2) #警告标志
				infoBox.setText('请选择摄像头名字！')
				infoBox.setStandardButtons(QMessageBox.Yes )
				infoBox.button(QMessageBox.Yes).animateClick(2*1000) #2秒自动关闭
				infoBox.exec_()    
		else:
			self.video1.cap.release()
			self.video2.cap.release()
			self.widget.close()
			self.lbl_name1.setText('未命名')
			self.lbl_name2.setText('未命名')
			self.btn_open.setEnabled(True)
			QMessageBox.warning(self, '信息', '没有检测到摄像头，绑定失败！', QMessageBox.Yes )
		


```
