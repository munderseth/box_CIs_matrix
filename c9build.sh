#!/bin/bash

# Client install and configure (using "mark-s2-tec")
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin
CI=true testspace config url http://mark.stridespace.com
testspace -v

# Test
BRANCH_NAME=`git symbolic-ref --short HEAD` 
printenv > printenv.txt

# Push
testspace [ONE]test.xml [TWO]test.xml "+printenv.txt{environment variables}" --repo git