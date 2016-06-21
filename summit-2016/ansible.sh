- name: upgrade
  gather_facts: no
  tasks:
    - name: upgrade host
      command: 'rpm-ostree upgrade'
    - name: restart host
      command: 'shutdown -r now'
      async: 0
      poll: 0
      ignore_errors: true
    - name: waiting for server to come back
      local_action: wait_for host={{ inventory_hostname }} port=22 delay=30 timeout=300
      sudo: false
    - name: change
      command: 'sed -i "s/7.2.3/7.2.4/" /etc/os-release'
