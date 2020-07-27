#!/bin/sh
#

#cd /opt/rancher
#./rancher login https://k8s.eur.ad.sag/v3 --token token-vzcht:b6drnslrqsf2cnwnxr8jxp572zqkj4fl5hzxjq94tgl22qh4xdq2r9
#./rancher login https://k8s.eur.ad.sag/v3 --token token-k72zj:pbdbzjfxnr8ck4ffq7pgv2d8mb55krmnx26v4rm2qglgxb22h2kz2g
#./rancher kubectl create -f ${WORKSPACE}/PushCustomerImageToAKSK8.yaml
az login --service-principal -u 'http://ServicePrincipalName' -p '4f39369a-805d-42c7-a232-f9034fb6d0fb' --tenant '54d5b4cb-23eb-471e-a390-e1a7e1f975ed'
az aks get-credentials --resource-group akstest --name sagaks
#./rancher kubectl replace -f ${WORKSPACE}/PushCustomerImageToK8.yaml
kubectl create -f ${WORKSPACE}/PushCustomerImageToAKSK8.yaml 

