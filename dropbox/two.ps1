$env:DropBoxAccessToken="sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8"

# curl.exe -X POST https://content.dropboxapi.com/2/files/upload `
#   --header 'Authorization: Bearer sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8' `
#   --header 'Content-Type: application/octet-stream' `
#   --header 'Dropbox-API-Arg: {"path":"./file1.txt"}' 

# curl.exe -X POST https://content.dropboxapi.com/2/files/upload `
#         --header 'Authorization: Bearer sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8' `
#         --header 'Content-Type: application/octet-stream' `
#         --header "Dropbox-API-Arg: {\"path\": \"/file1.txt\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" `
#         --data-binary "@file1.txt"

# function Upload-FileToDropbox { 
#     param(
#         [Parameter(Mandatory=$true)]
#         [string]$SourcePath,
#         [Parameter(Mandatory=$true)]
#         [string]$TargetPath,
#         [Parameter(Mandatory=$true)]
#         [string]$AccessToken
#     )

#     $body = '{ "path": "' + $TargetPath + '", "mode": "overwrite" }'

#     $authorization = "Bearer $AccessToken"

#     $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

#     $headers.Add("Authorization", $authorization)
#     $headers.Add("Dropbox-API-Arg", $body)
#     $headers.Add("Content-Type", 'application/octet-stream')
     
#     Invoke-RestMethod `
#         -Uri 'https://content.dropboxapi.com/2/files/upload' `
#         -Method Post `
#         -InFile $SourcePath `
#         -Headers $headers
# }

# Upload-FileToDropbox "./file1.txt" "/home/Apps/my_ebooks/" "sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8"

function Upload-FileToDropbox { 

    $body = '{ "path": "' + "/home/apps/my_ebooks" + '", "mode": "overwrite" }'

    $authorization = "Bearer sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

    $headers.Add("Authorization", $authorization)
    $headers.Add("Dropbox-API-Arg", $body)
    $headers.Add("Content-Type", 'application/octet-stream')
     
    Invoke-RestMethod `
        -Uri 'https://content.dropboxapi.com/2/files/upload' `
        -Method Post `
        -InFile "./file1.txt" `
        -Headers $headers
}

Upload-FileToDropbox