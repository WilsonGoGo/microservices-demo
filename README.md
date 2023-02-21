# 部署

## 安装

### 1.安装docker

```bash
sudo apt  install docker.io
sudo usermod -aG docker $USER && newgrp docker
```

### 2.安装minikube

```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

```

### 3.安装kubectl

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

```

### 4.安装skaffold

```bash
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64  
chmod +x skaffold  
sudo mv skaffold /usr/local/bin  
```



## 启动服务

```bash
# 下载仓库
git clone https://github.com/WilsonGoGo/microservices-demo.git
cd microservices-demo

# 启动minikube, 首次启动需拉取镜像，可能花费较长时间
minikube start --kubernetes-version=v1.23.8 \
    --image-mirror-country='cn' \
    --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers' \
    --cpus=4 --memory 8192 --disk-size 32g
    
# 启动服务：首次启动需要构建镜像，用时较长
skaffold run
    
# 暴露端口
kubectl --address 0.0.0.0 port-forward deployment/frontend 8080:8080

# 待项目部署成功后运行一段时间，再执行采集日志的脚本
cd getLogs
chmod +x getLogs.sh
./getLogs.sh
```

