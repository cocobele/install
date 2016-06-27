#! /bin/bash

cat << EOF


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REQUIRED:     centOS-5.x (Defulte 32bit)
DESCRIPTION:  Install bizsky in CentOS
AUTHOR:       Xu.Li
REVISION:     1.0
++++++++++++++++++++++++++++++++++++++++++++++++++++++++


EOF
######################################引入配置数组################################
. ./config.conf
##################################################################################  ready.conf
#######################################CentOS5下的安装，主要采取yum方式或安装好的包直接解压
echo -e "++++++++++++++++++++++++++++Section 0 Ready++++++++++++++++++++++++++++"

. ./ready.conf
#检查是否有root权限
root
#Require root
disable_selinux
## 停止不必要的服务
stop_servers
##屏蔽交互提示
mask_cross
### 在root用户目录建立.ssh目录便于远程上传文件更新
mkdir -p ~/.ssh
chmod 700 ~/.ssh

### 卸载可能的邮件服务，避免冲突
yum -y remove sendmail &>/dev/null
yum -y remove postfix &>/dev/null

### 下载需要的源代码
DOWNLOAD

##如系购买美国VPS主机，则时间可能不对需要，调整为上海时间，同时要停下检查系统时间对不对
if date | grep CST &>/dev/null; then
    echo ''
    else
        rm -rf /etc/localtime
        ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
fi

## first install compile package  如为CentOS
requirerpm
## 创建网站根目录
createBizsky

##################################################################################  mysql.conf
. ./mysql.conf
mysql_install
