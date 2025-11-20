ansible-playbook /home/m/ansible/playbooks/repo_zabbix_ubuntu.yml --limit oci:home
ansible-playbook /home/m/ansible/playbooks/packages_install.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/packages_upgrade.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/reboot_after_upgrade.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/create_users.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/config_sshd.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/config_rsyslog.yml --limit oci:home:zabbix
ansible-playbook /home/m/ansible/playbooks/config_zabbix_agent2.yml --limit oci:home




ansible-playbook /home/m/ansible/playbooks/config_wireguard_client.yml --limit oci:instance1
ansible-playbook /home/m/ansible/playbooks/role_docker.yml --limit oci
ansible-playbook /home/m/ansible/playbooks/install_dockge.yml --limit oci
ansible-playbook /home/m/ansible/playbooks/install_cup.yml --limit oci
ansible-playbook /home/m/ansible/playbooks/install_dozzle.yml --limit oci


#ansible-playbook /home/m/ansible/playbooks/install_nextcloud.yml --limit instance1
#ansible-playbook /home/m/ansible/playbooks/install_site_web_epalzeo.yml --limit instance1
