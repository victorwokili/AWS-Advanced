
# Check if ssh-agent is running
```powershell
Get-Service ssh-agent
```

# Start the service
```powershell
Start-Service ssh-agent
```

# This should return a status of Running
```powershell
Get-Service ssh-agent
```

# Now load your key files into the ssh-agent
rememeber to edit the location of your key file
```powershell
ssh-add C:\Users\Admin\my-ec2key.pem
```

# SSH into the instance (bastion host) in the public subnet. Remember to allow agent forwarding
```powershell
ssh -A <bastion_host_ip>
```

Replace <bastion_host_ip> with the actual IP address of your bastion host.
