#Basic syntax.
Function hello {Write-Host "Hello World"}

#Reads the contents of the profile script holding various aliases.
Function read {cat C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Profile.ps1}

#Removes all exited docker containers.
Function drm {docker rm (docker ps -a -q)}

#Alias for the Windows Subsystem for Linux text editor (pico).
Function pico {wsl pico}

# Lists the contents of the Modules directories
Function list_modules {dir C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules}

# Copies the active Profile.ps1 file to its git tracked directory.
Function update_profile {
    Copy-Item C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Profile.ps1 C:\Users\$env:USERNAME\Documents\powershell\Profile
}

# Reads the source code of a module.
Function read_module($module){
    cat C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Modules\$module\$module.psm1
}

# Updates the git tracked powershell directory and commits to the external repository.
Function update_git
{
    param(
        [string]$comment=$(throw "A comment must be added for git commit.")
    )
    Set-Location C:\Users\$env:USERNAME\Documents\powershell
    git add -A
    git commit -m "$comment"
    git push -u origin master
}

#Removes all local docker images
Function dra
{
	docker images -a -q | % { docker image rm $_ -f }
}