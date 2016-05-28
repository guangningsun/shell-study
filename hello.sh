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


#注释

###############################
#
#
# 如果注释太多可以写到函数里，
# 避免调用时再删除#
#
#
##############################



#单引号
echo '这是单引号的输出 $a'

#字符串操作
s="this is a string"
echo 字符串长度${#s}
echo 截取字符串 ${s:1:5}
echo 查找字符串 `expr index "$s" iiii`

#数组
array=(1 2 3 4 5)
echo s数组第一个值为 ${array[0]}
echo 取得数组长度 ${#array[*]} ${#array[@]}
echo 取得数组值的长度 ${#array[0]}


#case 

read num
 
case $num in 

  1) echo " input 1"
  ;;
    
  2) echo " input 2 "
  ;;
    
  *) echo "nothing input"
  ;;

esac


option="${1}"
case ${option} in
   -f) FILE="${2}"
      echo "File name is $FILE"
      ;;
   -d) DIR="${2}"
      echo "Dir name is $DIR"
      ;;
   *) 
      echo "`basename ${0}`:usage: [-f file] | [-d directory]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac

#for 循环
for str in 'This is a string'
do
    echo $str "\n"
done


for FILE in $HOME/.bash*
do
   echo $FILE
done

#whie 循环
conter=0
max=5
while [[ "$conter" -lt  "$max"  ]]
do
  
  conter=`expr $conter + 1`
  echo $conter

done

#util循环
#break命令

while :
do 
   echo "输入一个数字"
   read num
   case $num in
      1|2|3|4|5) echo "你输入的数字是 $num"
      ;;
      *) echo "你输入的数字不在1~5中间"
      break 2
      ;;
   esac
done

# continue命令

while :
do
   echo "输入一个数字"
   read num
   case $num in
      1|2|3|4|5) echo "你输入的数字是 $num"
      ;;
      *) echo "你输入的数字不在1~5中间"
         #continue 此处写不写continue作用相同
         echo "游戏结束"
      break 3
      ;;
   esac
done


# 函数
hello(){
   echo "调用了 hello 函数"
   echo "穿入的第一个参数${1}"
   echo "传入的所有参数$*"
   return 5
}

hello 11 12 13 

retNum=$?

echo "调用函数的返回值为 $retNum"

#删除函数
#$unset .f function_name


#输出重定向 > 和>>

echo `who > users`

echo `who >> users1`

#输入重定向
echo `wc -l users`
echo `wc -l <users`

#输入文档

filename=test.txt

writefile(){
vim $filename << EndOfCommands
i
This file was created automatically from
a shell script
^[
ZZ
EndOfCommands

}

# dev/null

echo "屏蔽输出" > /dev/null >shell.log

echo 执行结果 $?

# 调用其他脚本内容
. subscript.sh
echo 其他脚本的参数为 $url
