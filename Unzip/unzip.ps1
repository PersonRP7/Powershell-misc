$file = Get-ChildItem -Path "." -Filter *.zip | Where-Object { $_.Extension -eq '.zip' }

function unzip {

    Expand-Archive -Path $file -DestinationPath "." 
    
}
unzip
