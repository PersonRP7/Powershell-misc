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

#Removes all running docker containers, obviating the need for 
#engaging docker-compose in the local directory.
Function rmr
{
	docker rm -f $(docker ps -a -q)
}

#Alias for Start-BitsTransfer. Used for downloading files to the current directory.
Function dl($source)
{
	Start-BitsTransfer -Source $source
}

#Sends an affirmative response to the standard input, then purges all docker volumes.
Function rmv()
{
	ECHO Y | docker volume prune
}

#Activates a python virtual environment.
Function activate()
{
	./env/Scripts/Activate.ps1
}

#Run Server (basic) Runs Django development server at default port 8000.
Function rsb()
{
	python manage.py runserver
}

#Run Django server on the meta address.
Function rs()
{
	python manage.py runserver 0.0.0.0:8000
}

#Searches the user's directory for a specified directory.
Function wd($query_parameter)
{
	ls C:\\Users\$env:USERNAME *$query_parameter* -Recurse -Directory | select fullname
}

#Searches the user's directory for a specified file.
Function wf($query_parameter)
{
	ls C:\\Users\$env:USERNAME *$query_parameter* -Recurse -File | select fullname
}

