#!/bin/bash
uid=$1
upw=$2
uidarr=(${uid//,/ }) #字符串预处理
upwarr=(${upw//,/ })
num=${#uidarr[@]}
smbtn="进入健康状况上报平台"
url1="https://jksb.v.zzu.edu.cn/vls6sss/zzujksb.dll/login"
url2="https://jksb.v.zzu.edu.cn/vls6sss/zzujksb.dll/jksb"
for((i=0;i<num;i++))
do
case word in
  i=0)[
        curl -d "uid=${uidarr[i]}&upw=${upwarr[i]}&smbtn=$smbtn&hh28=907" -s $url1 -o temp.txt
        udata=$(sed -n '11p' temp.txt)
        udata=${udata#*ptopid=}
        udata=${udata%\"\}\}*}
        ptopid="${udata%&*}"
        sid="${udata#*&sid=}" #登录获取ptopid和sid
        curl -d "day6=b&did=1&men6=a" -d "ptopid=$ptopid&sid=$sid" -s $url2 -o /dev/null #进入确认界面
        curl -d "@myvs1.txt" -d "jingdu=115.041&weidu=35.768&ptopid=$ptopid&sid=$sid" -s $url2 -o temp.txt #打卡
        udata=$(sed -n '24,26p' temp.txt)
        echo "$udata" > result.html]
  ;;
  i=1)[curl -d "uid=${uidarr[i]}&upw=${upwarr[i]}&smbtn=$smbtn&hh28=907" -s $url1 -o temp.txt
        udata=$(sed -n '11p' temp.txt)
        udata=${udata#*ptopid=}
        udata=${udata%\"\}\}*}
        ptopid="${udata%&*}"
        sid="${udata#*&sid=}" #登录获取ptopid和sid
        curl -d "day6=b&did=1&men6=a" -d "ptopid=$ptopid&sid=$sid" -s $url2 -o /dev/null #进入确认界面
        curl -d "@myvs2.txt" -d "jingdu=116.737&weidu=35.136&ptopid=$ptopid&sid=$sid" -s $url2 -o temp.txt #打卡
        udata=$(sed -n '24,26p' temp.txt)
        echo "$udata" >> result.html]
  ;;
esac
done
