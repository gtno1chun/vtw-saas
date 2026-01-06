참고사이트 :
``` 
https://www.redhat.com/ko/blog/install-openshift-local 
https://crc.dev/docs/installing/
```


## 설치 명령어 : 
```
### KVM 설치  및 권한 적용 
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtiofsd 

### 권한 문제 해결을 위해 현재 그룹을 가상화 그룹에 추가 
sudo adduser $USER libvirt
sudo adduser $USER kvm 

### 그룹변경 즉시 적용 
newgrp libvirt
newgrp kvm
또는 터미널 재시작 

### 최신 CRC 다운로드 (Ubuntu용)
wget https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz
tar -xf crc-linux-amd64.tar.xz
sudo cp crc-linux-*-amd64/crc /usr/local/bin/

crc setup

### 자원 할당 
crc config set memory 32768
crc config set cpus 8

### hedhat에서 다운로드 (로그인필요) 
crc start -p pull-secret.txt
```

## 개인 환경설정 명령어 : 
```
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
또는 
sudo usermod -aG libvirt,kvm $USER

터미널 재접속 

mkdir ~/.kube
sudo cp /home/vtwsaas/.kube/config ~/.kube/. 
sudo chown $USER:kvm config 

oc get nodes 또는 kubectl get nodes 

GUI 접근: 
openshift URL:   https://console-openshift-console.apps-crc.testing

Log in as administrator:
  Username: kubeadmin
  Password: nIfnZ-qYjwv-txv6e-V9TDr
  ### 패스워드 확인 
  crc console --credentials

Log in as user:
  Username: developer
  Password: developer
```

## 서버 재부팅 후 수동 시작 절차 (테스트 필요) 
```
sudo systemctl start libvirtd
crc start
```


