#Basic syntax.
Function hello {Write-Host "Hello World"}

#Reads the contents of the profile script holding various aliases.
Function read {cat C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Profile.ps1}

#Removes all exited docker containers.
Function drm {docker rm (docker ps -a -q)}

#Alias for the Windows Subsystem for Linux text editor (pico).
Function pico {wsl pico}

Function list_modules {dir C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules}

Function update_profile {
    Copy-Item C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Profile.ps1 C:\Users\$env:USERNAME\Documents\powershell\Profile
}
