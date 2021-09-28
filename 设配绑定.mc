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
