# 📝Docker 镜像加速

该镜像服务使用`nginx`搭建，仅供本人测试使用，**不对任何稳定性负责**。


## 1 本站介绍

### 1.1 支持多镜像平台

> 支持市面上常见的Docker Hub镜像站下载；有些已失效，除主镜像站外其他可能不再维护。


|  序号 | 代理站  | 源站                      | 平台                              |
| :--: | --- | ----------------------- | ------------------------------- |
|  1   | hub.si.icu | https://registry-1.docker.io | Docker Hub |
|  2   | gcr.hub.si.icu | https://gcr.io  | Google Container Registry       |
|  3   | ghcr.hub.si.icu | https://ghcr.io | GitHub Container Registry       |
|  4   | k8s-gcr.hub.si.icu | https://k8s.gcr.io   | Kubernetes Container Registry   |
|  5   | k8s.hub.si.icu | https://registry.k8s.io  | 新 Kubernetes Container Registry |
|  6   | quay.hub.si.icu | https://quay.io | Red Hat Container Registry      |
|  7   | nvcr.hub.si.icu | https://nvcr.io | NVIDIA


### 1.2 DockerHub多种方式拉取

- 若镜像来源于 **`Docker Hub`** 镜像仓库，推荐 `2种` 拉取方式。
- 若不是，仅推荐第一种拉取方式。

```bash
# 方式 1：不加镜像站域名
docker pull hub.si.icu/library/nginx
docker pull hub.si.icu/xhofe/alist

# 方式 2：配置/etc/docker/daemon.json (推荐)
docker pull redis
docker pull grafana/grafana:latest
```

## 2 配置使用

### 2.1 配置加速器

​	在 **`/etc/docker/daemon.json`** 文件中，参考如下字段配置，

```bash
cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://hub.si.icu"]
}
EOF
```

```bash
# 重启Docker服务
systemctl daemon-reload && systemctl restart docker
```


## 2.拉取测试

📢 **注意事项：** 若配置了加速器地址，并且镜像源于 **`Docker Hub`** 时，**可以无需加上域名前缀**，其他镜像源站必须加上前缀，例如：

- 源于 **`Docker Hub`** 镜像地址： **`alpine:3.18`** 与 **`adguard/adguardhome`** ，则

```bash
docker pull alpine:3.18
docker pull adguard/adguardhome

# 当然也是可以加上前缀，如：
docker pull hub.si.icu/library/alpine:3.18
docker pull hub.si.icu/adguard/adguardhome
```

- 拉取非 **`Docker Hub`** 平台镜像时， **目前仅支持替换域名**，各个知名镜像站拉取测试，如下：

```bash
# Google
docker pull gcr.hub.si.icu/kaniko-project/executor:debug
# GitHub
docker pull ghcr.hub.si.icu/openfaas/queue-worker
# Kubernetes
docker pull k8s-gcr.hub.si.icu/etcd:3.5.7-0
# 新Kubernetes
docker pull k8s.hub.si.icu/kube-apiserver:v1.30.0
# Red Hat
docker pull quay.hub.si.icu/calico/cni
# NVIDIA
docker pull nvcr.hub.si.icu/nvidia/cuda:12.1.0-runtime-ubuntu20.04
```



### 以下暂不支持

```bash
# Google
docker pull hub.si.icu/gcr.io/kaniko-project/executor:debug
# GitHub
docker pull hub.si.icu/ghcr.io/openfaas/queue-worker
# Kubernetes
docker pull hub.si.icu/k8s.gcr.io/etcd:3.5.7-0
# 新Kubernetes
docker pull hub.si.icu/registry.k8s.io/kube-apiserver:v1.30.0
# Red Hat
docker pull hub.si.icu/quay.io/calico/cni
# NVIDIA
docker pull hub.si.icu/nvcr.io/nvidia/cuda:12.1.0-runtime-ubuntu20.04
```