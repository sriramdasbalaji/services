cd C:\
mkdir azagent
cd C:\azagent
.\config.cmd --unattended --url "https://dev.azure.com/sriramdasbalaji" --auth pat --token "4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka" --pool "ZF" --agent "myvm0306" --runAsService

Stop-Transcript
exit 0
