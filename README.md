# absam

1. Execute the `install-ansible` script to add the keys and install the ansible
2. Execute the `local-machine.sh` script
_2.1 You need to pass the `master_ip` and `workers_ip`'s and `workers_psw`'s 
_2.2 If you miss some of them it will not replace it correctly and it could break when installing the master or worker nodes. The arguments are:
__2.2.1 m: master_ip
__2.2.2 a: worker_1_ip
__2.2.3 b: worker_1_psw
__2.2.4 c: worker_2_ip
__2.2.5 d: worker_2_psw
__2.2.6 e: worker_3_ip
__2.2.7 f: worker_3_psw
3. Hope that everything works and drink a beer