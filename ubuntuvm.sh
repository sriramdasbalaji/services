#!/bin/sh
cd /home/azureuser;mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.170.1/vsts-agent-linux-x64-2.170.1.tar.gz;sleep 5;tar -zxvf vstsagent.tar.gz;sleep 10;./config.sh --auth pat --token 4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka --acceptTeeEula --pool ZF  --agent ubuntu18042 --url https://dev.azure.com/sriramdasbalaji/ --work _work --replace --runasservice;sudo ./svc.sh install;sudo ./svc.sh start;
