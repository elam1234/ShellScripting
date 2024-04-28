#!/bin/bash

url="https://api.github.com/repos/praveen1994dec/python_automation/pulls"

get_data=$(curl -s "$url")

if [ $? -ne 0 ];then 
   echo "the url is not given a successful output"
   exit 1
fi

username=$(echo "$get_data" | jq -r '.[0].user.login')

echo "$username"
