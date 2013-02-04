#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No arguments supplied"
	exit 1
fi

DTA=~/diy-0.1/data

cd $DTA
git clone git://github.com/pooler/cpuminer.git
cd cpuminer
./autogen.sh
./configure CFLAGS="-O3"
make
cat > $DTA/start <<EOF
tmux new -d -s miner "./minerd --url http://mine.pool-x.eu --userpass xomelle.$1:x"
EOF
chmod +x $DTA/start