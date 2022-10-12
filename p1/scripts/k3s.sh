HOSTNAME=$(hostname)
/usr/local/bin/k3s-killall.sh

if [ "$HOSTNAME" == "msabwatS" ]
then
	echo "coucou server"
	# sudo K3S_KUBECONFIG_MODE="644" K3S_TOKEN="supersecret" /usr/local/bin/k3s server --selinux --node-ip 192.168.56.111&
	curl -sfL https://get.k3s.io | K3S_TOKEN="mysupersecrettoken" K3S_KUBECONFIG_MODE="644" sh -s - server --selinux --node-ip 192.168.56.110
	sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/secret
elif [ "$HOSTNAME" == "msabwatSW" ]
then
	echo "coucou agent"
	# sudo K3S_KUBECONFIG_MODE="644" K3S_TOKEN="supersecret" /usr/local/bin/k3s agent --selinux --server https://192.168.56.110:6443 --node-ip 192.168.56.111&
	curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s - agent --selinux --server "https://192.168.56.110:6443" --token-file /vagrant/secret --node-ip 192.168.56.111
fi
