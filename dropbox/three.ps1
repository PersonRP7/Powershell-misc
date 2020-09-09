function upload { 
    param(
        [Parameter(Mandatory=$true)]
        [string]$SourcePath,
        [Parameter(Mandatory=$true)]
        [string]$TargetPath,
        [Parameter(Mandatory=$true)]
        [string]$AccessToken
    )

    $body = '{ "path": "' + $TargetPath + '", "mode": "overwrite" }'

    $authorization = "Bearer $AccessToken"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

    $headers.Add("Authorization", $authorization)
    $headers.Add("Dropbox-API-Arg", $body)
    $headers.Add("Content-Type", 'application/octet-stream')
     
    Invoke-RestMethod `
        -Uri 'https://content.dropboxapi.com/2/files/upload' `
        -Method Post `
        -InFile $SourcePath `
        -Headers $headers
}

upload "./file1.txt" "/home/Apps/e_books" "IkjAtgY0vW4AAAAAAAAAAcq0unci3DT7M_CbfFwAjpbsMoez11V4xTUQtovnB-Kp"