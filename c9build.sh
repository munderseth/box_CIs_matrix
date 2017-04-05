#!/bin/bash

# Download Client
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | sudo tar -zxvf- -C /usr/local/bin
# using "mark-s2-tec"
export MARK_TOKEN=095d8acfaaf71b4a0f3767e41152620ebdda1b31
BRANCH_NAME=`git symbolic-ref --short HEAD` 
testspace config url http://$MARK_TOKEN@mark.stridespace.com/munderseth:box_CIs_matrix/$BRANCH_NAME

# Build

# Test
printenv > printenv.txt

# Push
testspace [ONE]test.xml [TWO]test.xml "+printenv.txt{environment variables}" --repo git