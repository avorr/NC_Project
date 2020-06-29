#!/bin/python3
import os
out = 100
while out!= 0 or a! = 1:
    print("wait")
    out = os.system('$(cat ~/.ssh/cli) create-credentials-by-xml system::system::jenkins "(global)" < ~/ansible-playbooks/sshcredentials.xml')