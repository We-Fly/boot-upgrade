# boot-upgrade：树莓派Ubuntu内核监测工具
## 说明：

- 本工具可监测Ubuntu系统system-boot分区下vmlinuz文件的变动，当监测到vmlinuz文件发生变动时（系统更新内核），将自动将新的vmlinuz压缩内核解压至vmlinux文件中，以免出现更新后引导起不来的问题。

## 安装：

- 克隆本仓库 git clone https://github.com/We-Fly/boot-upgrade.git ，或者在联网状态下使用install.sh安装文件
- 打开boot-upgrade文件夹，执行sudo chmod 755 * 赋予可执行权限
- 执行./install.sh安装文件（注意，不要加sudo），安装文件在执行完毕后会清理文件夹。

## 使用：

- 查看运行状态：sudo systemctl status boot-upgrade.service
- 启动服务：sudo systemctl start boot-upgrade.service
- 关闭服务：sudo systemctl stop boot-upgrade.service
- 重启服务：sudo systemctl restart boot-upgrade.service
- 开机自启动服务：sudo systemctl enable boot-upgrade.service
- 取消开机自启动：sudo systemctl disable boot-upgrade.service


## 原理：

- 本工具安装在/usr/bin目录下，并注册为root用户权限的系统服务，安装结束后会自动设置启动服务并开启开机自启动。本工具通过inotify-tools工具监测vmlinuz文件是否发生变动，监测效率高且资源占用低，当检测到vmlinuz文件发生变动时（系统更新内核）会结束监测，延时10秒后进行下一步操作（以免在系统对vmlinuz文件更改时对其操作引起冲突），将vmlinux文件备份为vmlinux.old，把新的压缩内核vmlinuz解压到vmlinux.new，解压成功后再将vmlinux替换成新的解压缩内核。所有操作完成后程序会开始新的循环，无需手动重启服务或者重启系统。据测算在树莓派上完成内核解压大概需要80秒，所以执行完更新命令后请等待至少两分钟再进行关机、重启操作。