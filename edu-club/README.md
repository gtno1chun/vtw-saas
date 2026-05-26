# 자동화를 이용한 prometheus 모니터링 도구 설치 



```
### CLI 명령어 
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 85.3.3
```

## 기본 환경 설정 
```
### 컨테이너 환경 구성 (docker 설치) 

### OpenTofu 설치 
$ sudo snap install opentofu --classic 
opentofu 1.12.0 from OpenTofu Core Team✓ installed
```

## minikube 시작 
```
$ minikube start 
😄  minikube v1.38.1 on Ubuntu 24.04 (amd64)
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.50 ...
🔄  Restarting existing docker container for "minikube" ...
🐳  Preparing Kubernetes v1.35.1 on Docker 29.2.1 ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image registry.k8s.io/metrics-server/metrics-server:v0.8.1
🌟  Enabled addons: default-storageclass, storage-provisioner, metrics-server
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

$ kubectl get pod -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-7d764666f9-rwt7b           1/1     Running   1 (38m ago)   49m
kube-system   etcd-minikube                      1/1     Running   1 (38m ago)   50m
kube-system   kube-apiserver-minikube            1/1     Running   1 (38m ago)   50m
kube-system   kube-controller-manager-minikube   1/1     Running   1 (38m ago)   50m
kube-system   kube-proxy-kbz7g                   1/1     Running   1 (38m ago)   49m
kube-system   kube-scheduler-minikube            1/1     Running   1 (38m ago)   50m
kube-system   metrics-server-9d74bb658-bpzhp     1/1     Running   1 (38m ago)   48m
kube-system   storage-provisioner                1/1     Running   3 (37m ago)   49m
```

