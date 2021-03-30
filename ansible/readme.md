Télécharger le module firewalld sur ansible depuis votre terminal :
```console 
ansible-galaxy collection install ansible.posix
```

Lancer la commande ci-dessous :
```console
ansible-playbook --user max --become -k -K -i inventories/server.ini playbooks/deploiementInstallation.yml 
```

NOTE : Pensez à modifier le user "max" par "centos" et à modifier l'ip de votre serveur dans server.ini
