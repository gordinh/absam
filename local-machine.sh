#!/bin/bash
master_ip=''
worker_1_ip=''
worker_1_psw=''
worker_2_ip=''
worker_2_psw=''
worker_3_ip=''
worker_3_psw=''

print_usage() { 
	echo "Usage:
		m: master_ip 
		a: worker_1_ip 
		b: worker_1_psw
		c: worker_2_ip 
		d: worker_2_psw 
		e: worker_3_ip 
		f: worker_3_psw"; 
	exit; 
}

while getopts 'm:a:b:c:d:e:f:' flag; do
	case "${flag}" in
		m) master_ip=$OPTARG ;;
		a) worker_1_ip=$OPTARG ;;
		b) worker_1_psw=$OPTARG ;;
		c) worker_2_ip=$OPTARG ;;
		d) worker_2_psw=$OPTARG ;;
		e) worker_3_ip=$OPTARG ;;
		f) worker_3_psw=$OPTARG ;;
		*) print_usage ;;
	esac
done

sed -i "s/{{master_ip}}/${master_ip}/g" ./hosts
sed -i "s/{{worker_1_ip}}/${worker_1_ip}/g" ./hosts
sed -i "s/{{worker_2_ip}}/${worker_2_ip}/g" ./hosts
sed -i "s/{{worker_3_ip}}/${worker_3_ip}/g" ./hosts
sed -i "s/{{worker_1_password}}/${worker_1_psw}/g" ./hosts
sed -i "s/{{worker_2_password}}/${worker_2_psw}/g" ./hosts
sed -i "s/{{worker_3_password}}/${worker_3_psw}/g" ./hosts


#Setting up the workspace directory and Ansible inventory file
mkdir ~/kube-cluster
cd ~/kube-cluster

nano ~/kube-cluster/hosts

ansible-playbook -i hosts ~/kube-cluster/initial.yml

ansible-playbook -i hosts ~/kube-cluster/master.yml

ansible-playbook -i hosts ~/kube-cluster/workers.yml