cd C:\
mkdir azagent
cd C:\azagent
Invoke-WebRequest -Uri https://vstsagentpackage.azureedge.net/agent/2.170.1/vsts-agent-win-x64-2.170.1.zip -OutFile c:\azagent\azagent.zip
Add-Type -AssemblyName System.IO.Compression.FileSystem;[System.IO.Compression.ZipFile]::ExtractToDirectory( "c:\azagent\azagent.zip", "$PWD");
.\config.cmd --unattended --url "https://dev.azure.com/sriramdasbalaji" --auth pat --token "4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka" --pool "ZF" --agent "myvm0306" --runAsService

Stop-Transcript
exit 0
