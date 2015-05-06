#Constant Variables
$machineUsername="MACHINE_USERNAME"
$machinePassword="MACHINE_PASSWORD"
$machineName="MACHINE_NAME";

#Function EnterRemote {
#Remove all existing Powershell sessions
    Get-PSSession | Remove-PSSession

#Encrypt password for transmission
    $SecurePassword = ConvertTo-SecureString -AsPlainText $machinePassword -Force

#Build credentials object
    $machineCredentials  = New-Object System.Management.Automation.PSCredential $machineUsername, $SecurePassword 
Write-Host : "Credentials object created"

#Create remote Powershell session 
    $Session = New-PSSession -ComputerName $machineName -Credential $machineCredentials 
Write-Host : "Remote session established"

#Check for errors
if ($Session.State -eq "Closed"){
    Write-Host : "Invalid creditials"
}else{
    Write-Host : "Login success"
    #Enter into the session
        Enter-PSSession $Session
}

#pause
#}

# Start script
#. EnterRemote 