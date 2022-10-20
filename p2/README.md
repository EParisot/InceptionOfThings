# on host machine
```
VBoxManage modifyvm Ubuntu --nested-hw-virt on
```

# on VM machine
## Install Vagrant and Kubectl
```
sudo apt install vagrant virtualbox kubectl
```

## Vagrant config
```
sudo mkdir /etc/vbox
echo "* 0.0.0.0/0 ::/0" > sudo tee -a /etc/vbox/networks.conf
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-scp
```

## Create VM with Vagrant
```
cd vagrant
vagrant up
```

## Copy config from VM to ~/.kube/config file
```
vagrant scp eparisotS:/etc/rancher/k3s/k3s.yaml .
mv k3s.yaml ~/.kube/config
```

## Start apps
```
kubectl apply -f applications/
```

## Check everything is correct
```
kubectl get all
kubectl get ingress
curl -H "Host:app1.com" 192.168.42.110
```