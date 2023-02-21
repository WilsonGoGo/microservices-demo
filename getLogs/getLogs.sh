#!/bin/bash

# 命令模板
# kubectl exec 
#     --namespace example-namespace 
#     example-pod -c second-container 
#     -- cat /tmp/example-file > local-file

# 查询模板
# wilson@ubuntu:~/workspace/microservices/microservices-demo$ kubectl get pods
# NAME                                     READY   STATUS    RESTARTS   AGE
# adservice-6fb9779796-l7bxm               1/1     Running   0          4m18s
# cartservice-6557d5b47d-c229p             1/1     Running   0          4m18s
# checkoutservice-66d4985656-2lpz8         1/1     Running   0          4m18s
# currencyservice-644b8bd6c-g7d5l          1/1     Running   0          4m18s
# emailservice-bd6fc9f7-8kv9j              1/1     Running   0          4m18s
# frontend-bd946645f-tn7zc                 1/1     Running   0          4m18s
# loadgenerator-74987fb57c-9hzx4           1/1     Running   0          4m17s
# paymentservice-7fc667cd97-dp4dj          1/1     Running   0          4m18s
# productcatalogservice-55ffd8995f-l4h48   1/1     Running   0          4m17s
# recommendationservice-6d5cbbf449-sdh8p   1/1     Running   0          4m17s
# redis-cart-5897668ccb-t926q              1/1     Running   0          4m17s
# shippingservice-6975d4b698-rr9nq         1/1     Running   0          4m17s

POD_NAME=`kubectl get pods | grep adservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/adservice/log.txt > ./adservice.log

POD_NAME=`kubectl get pods | grep cartservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/cartservice/log.txt > ./cartservice.log
POD_NAME=`kubectl get pods | grep checkoutservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/checkoutservice/log.txt > ./checkoutservice.log
POD_NAME=`kubectl get pods | grep currencyservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /usr/src/app/log/currencyservice/log.txt > ./currencyservice.log
POD_NAME=`kubectl get pods | grep emailservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/emailservice/log.txt > ./emailservice.log

POD_NAME=`kubectl get pods | grep frontend | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/frontend/log.txt > ./frontend.log
POD_NAME=`kubectl get pods | grep paymentservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /usr/src/app/log/paymentservice/log.txt > ./paymentservice.log
POD_NAME=`kubectl get pods | grep productcatalogservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/productcatalogservice/log.txt > ./productcatalogservice.log
POD_NAME=`kubectl get pods | grep recommendationservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/recommendationservice/log.txt > ./recommendationservice.log
POD_NAME=`kubectl get pods | grep shippingservice | awk '{print $1}'`
kubectl exec --namespace default $POD_NAME -c server -- cat /app/log/shippingservice/log.txt > ./shippingservice.log

# kubectl exec --namespace default loadgenerator-74987fb57c-9hzx4 -c server -- cat /app/log/loadgenerator/log.txt > ./loadgenerator.log