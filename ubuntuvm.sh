#!/bin/sh
cd /home/azureuser;mkdir azagent;cd azagent;curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.170.1/vsts-agent-linux-x64-2.170.1.tar.gz;sleep 5;tar -zxvf vstsagent.tar.gz;sleep 10;
sudo -E bin/Agent.Listener configure --unattended --nostart --replace --acceptteeeula --pool ZF  --agent ubuntu21062020  --url https://dev.azure.com/sriramdasbalaji/ --auth pat --token 4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka
sudo ./svc.sh install
sudo ./svc.sh start
