#!/bin/python3
import os
out = 1
while out!= 0:
    print("wait")
    out = os.system("$(cat ~/.ssh/cli) who-am-i")