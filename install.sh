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
##################################################################################  step 0
#######################################CentOS5下的安装，主要采取yum方式或安装好的包直接解压
echo -e "++++++++++++++++++++++++++++Section 0 Ready++++++++++++++++++++++++++++"

. ./ready.conf
#Require root
disable_selinux
stop_servers
mask_cross
DOWNLOAD