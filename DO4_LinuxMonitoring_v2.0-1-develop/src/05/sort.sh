#!/bin/bash

response_code(){
for day in {1..5}; do
    awk '{print}' "../04/nginx_${day}.log" | sort -k 9
done
}

unique_ip(){
for day in {1..5}; do
    awk '{print $1}' "../04/nginx_${day}.log"  | sort -n | uniq
done
}

requests_errors(){
for day in {1..5}; do
    awk '$9 ~ /^[45]..$/ {print}'  "../04/nginx_${day}.log" | sort -k 9
done
}

unique_ip_requests_errors(){
for day in {1..5}; do
    awk '$9 ~ /^[45]..$/ {print}'  "../04/nginx_${day}.log" | sort -n | uniq
done
}
