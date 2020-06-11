$connectTestResult = Test-NetConnection -ComputerName canarysdiag441.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"canarysdiag441.file.core.windows.net`" /user:`"Azure\canarysdiag441`" /pass:`"NcB5X3TyXqBvL0UcBloKjuqwj50FucQJ+ghFWaTQY1CugfIZJyLeXn24Zi2hwGSXcXzgVD37/Wc60lgBFwIaqA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\canarysdiag441.file.core.windows.net\myfiles" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}

#download and configure agent
wget https://vstsagentpackage.azureedge.net/agent/2.169.1/vsts-agent-win-x64-2.169.1.zip
cd C:\
mkdir azselfagent
cd azselfagent
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.169.1.zip", "$PWD")
.\config.cmd --unattended --url "https://dev.azure.com/sriramdasbalaji" --auth pat --token "4w3zyd6oiji6irv22f6ff6xxqrxq6vjkuxlvp2u2pfcx2hl3o7ka" --pool "CanarysAgentPool" --agent $env:computername --runAsService

Stop-Transcript
exit 0

# navigate to attached drive and create folder with machine name
Z:
mkdir $env:computername
