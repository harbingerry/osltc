#!/bin/bash

git clone git://github.com/pooler/cpuminer.git
cd cpuminer
./autogen.sh
./configure CFLAGS="-O3"
make
tmux new -d -s miner "./minerd --url http://mine.pool-x.eu --userpass xomelle.$1:x"