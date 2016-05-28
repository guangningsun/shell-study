#!/bin/bash

#输出
echo "你好!这是第一个shell脚本"

#输入
echo "随意输入一个名字"
read PERSON
echo "你好 ,$PERSON"

#自定义变量
myurl="http://guangningsun.github.io"
echo "自定义变量 myurl：",${myurl}

#删除变量
unset myurl
echo "删除变量",$myurl

#关于$的所有用法
echo 打印当前pid $$
echo 当前脚本的文件名     $0
echo 当前脚本的参数个数   $#
echo 当前脚本的第一个参数 $1
echo 当前脚本的所有参数   $*
echo 上个命令的返回值  $?
echo 当前脚本的所有参数另一种过表达方式  $@

#变量及转义字符

a=10
echo -e "最终值为a \n"
echo "不转义 a \n"

#将命令结果保存在变量中

currentDate=`date`
echo "Date is $currentDate "

loginuser=`who |wc -l`
echo "login user number is $loginuser"

up=`date ; uptime`
echo "uptime is $up "

#变量的替换

echo ${var:-"变量中没有值"}
echo 这是当前var的值 ${var}

echo ${var:="变量中没有值则赋予此字符串"}
echo 这是当前var的值 ${var}

echo ${var:+"变量中有值则输出此字符串"}
echo 这是当前var的值 ${var}

#unset var 注释该句则没有异常输出
echo ${var:?"变量未被定义测试"}

#算数运算

echo 加法运算结果为`expr 2 + 3`

#关系运算

abc=30
bcd=20

if [ $abc -eq $bcd ]

then

  echo a 于 b变量值相等

else

  echo a 与 变量b值不相等

fi
echo 关系运算的关键字有 eq ne  gt lt ge le
