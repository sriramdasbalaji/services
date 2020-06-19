cd /tmp
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/2.170.1/vsts-agent-linux-x64-2.170.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.170.1.tar.gz
./config.sh --unattended --url https://dev.azure.com/sriramdasbalaji --auth pat --token "4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka" --acceptTeeEula --pool "ZF" --agent $HOSTNAME --replace & wait $!

# AgentService.js understands how to handle agent self-update and restart
exec ./externals/node/bin/node ./bin/AgentService.js interactive
