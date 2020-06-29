#!/bin/python3
import os
out = 1
while out!= 0:
    print("wait")
    out = os.system("$(cat ~/.ssh/cli) install-plugin ansible -deploy")
