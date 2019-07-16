#/bin/sh
#start or stop the im-server

psid=0

#JDK所在路径
JAVA_HOME="/usr/local/jdk1.8.0_131"
#Java程序所在的目录（classes的上一级目录）
APP_HOME=/repository/build/
#java虚拟机启动参数
JAVA_OPTS="-ms512m -mx512m -Xmn256m -Djava.awt.headless=true -XX:MaxPermSize=128m"

checkpid() {
   javaps=`ps -ef | grep $1 | grep -v "grep"`
 
   if [ -n "$javaps" ]; then
      psid=`echo $javaps | awk '{print $2}'`
   else
      psid=0
   fi
}

###################################
#(函数)停止程序
#
#说明：
#1. 首先调用checkpid函数，刷新$psid全局变量
#2. 如果程序已经启动（$psid不等于0），则开始执行停止，否则，提示程序未运行
#3. 使用kill -9 pid命令进行强制杀死进程
#4. 执行kill命令行紧接其后，马上查看上一句命令的返回值: $?
#5. 如果步骤4的结果$?等于0,则打印[OK]，否则打印[Failed]
#6. 为了防止java程序被启动多次，这里增加反复检查进程，反复杀死的处理（递归调用stop）。
#注意：echo -n 表示打印字符后，不换行
#注意: 在shell编程中，"$?" 表示上一句命令或者一个函数的返回值
###################################
stop() {
   checkpid $1
   if [ $psid -ne 0 ]; then
      echo -n "Stopping $1 ...(pid=$psid) "
      kill -9 $psid
      if [ $? -eq 0 ]; then
         echo "[OK]"
      else
         echo "[Failed]"
      fi
   else
      echo "================================"
      echo "warn: $APP_MAINCLASS is not running"
      echo "================================"
   fi
}

start() {
   checkpid $1
   if [ $psid -ne 0 ]; then
      stop $1
   fi
      echo -n "Starting $1 ..."
      nohup java -jar  $JAVA_OPTS ${APP_HOME}$1 >/repository/build/$1.log 2>&1 &
      echo " [OK]"
}

function full() {
    start gateway-0.0.1.jar
    start app-provider-0.0.1.jar
    start app-customer-0.0.1.jar
    start account-provider-0.0.1.jar
    start account-customer-0.0.1.jar
}
function killall() {
    stop gateway-0.0.1.jar
    stop app-provider-0.0.1.jar
    stop app-customer-0.0.1.jar
    stop account-provider-0.0.1.jar
    stop account-customer-0.0.1.jar
}
function cpfile() {
   # rm -rf /repository/build/*.jar
    mv /repository/build/application/account-customer/target/account-customer-0.0.1.jar  /repository/build/
    mv /repository/build/application/app-customer/target/app-customer-0.0.1.jar  /repository/build/
    mv /repository/build/control/discovery/target/discovery-0.0.1.jar  /repository/build/
    mv /repository/build/control/gateway/target/gateway-0.0.1.jar  /repository/build/
    mv /repository/build/core/account-provider/target/account-provider-0.0.1.jar  /repository/build/
    mv /repository/build/core/app-provider/target/app-provider-0.0.1.jar  /repository/build/

}
cpfile
case $1 in
	full)
		full
		;;
   kill)
		killall
		;;
	*)
		echo "Usage: "
		echo "  ./start.sh (full|kill|other)"
		;;
esac
