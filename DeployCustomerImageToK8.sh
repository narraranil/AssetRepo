#!/bin/sh
#

cd /opt/rancher
#./rancher login https://k8s.eur.ad.sag/v3 --token token-vzcht:b6drnslrqsf2cnwnxr8jxp572zqkj4fl5hzxjq94tgl22qh4xdq2r9
./rancher login https://k8s.eur.ad.sag/v3 --token token-k72zj:pbdbzjfxnr8ck4ffq7pgv2d8mb55krmnx26v4rm2qglgxb22h2kz2g
./rancher kubectl create -f ${WORKSPACE}/PushCustomerImageToK8.yaml 
#./rancher kubectl replace -f ${WORKSPACE}/PushCustomerImageToK8.yaml 

