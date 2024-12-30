#!/bin/bash
export TERM=linux
cd

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

sleep 2

curl -s https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -L -O -J
sleep 2
tar -xf gotty_linux_amd64.tar.gz
sleep 2
curl -s https://github.com/fatedier/frp/releases/download/v0.48.0/frp_0.48.0_linux_amd64.tar.gz -L -O -J
sleep 2
tar -xvf frp_0.48.0_linux_amd64.tar.gz
sleep 2
cp frp_0.48.0_linux_amd64/frpc ~/

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

./gotty --permit-write --reconnect /bin/bash & ./frpc -c frpc.ini

