#!/bin/bash

source "sort.sh"

if [[ $# -eq 1 ]]; then
if [[ $1 -eq 1 ]]; then
  echo "All entries sorted by response code"
  response_code >> response_code.txt
elif [[ $1 -eq 2 ]]; then
  echo "All entries sorted by unique IP"
  unique_ip >> unique_ip.txt
elif [[ $1 -eq 3 ]]; then
  echo "All records sorted by requests with errors (response code - 4xx or 5xx)"
  requests_errors >> requests_errors.txt
elif [[ $1 -eq 4 ]]; then
  echo "All records sorted by unique IP, that occur among erroneous requests"
  unique_ip_requests_errors >> unique_ip_requests_errors.txt
else
  echo "ERROR:You must enter numeric parameter(1 or 2 or 3 or 4)"
fi
else
  echo "ERROR:You must enter one numeric parameter(1 or 2 or 3 or 4)"
fi