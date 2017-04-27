#!/bin/bash

# Client install and configure (using "mark-s2-tec")
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin
CI=true testspace config url http://095d8acfaaf71b4a0f3767e41152620ebdda1b31:@mark.stridespace.com
testspace -v

# Test
BRANCH_NAME=`git symbolic-ref --short HEAD` 
printenv > printenv.txt

# Push
testspace ?start --repo git
testspace  test.xml "?add#/ONE"
testspace  test.xml "+printenv.txt{environment variables}" "?add#/TWO" 
testspace ?finish