# function delete_all_contents 
# {
#     Get-ChildItem -Path C:\Users\$env:USERNAME\AppData\Roaming\mIRC\downloads -Include *.* -File -Recurse | foreach { $_.Delete()}
# }

# $path = "some path"

# function write_path
# {
#     Write-Host $path
# }
# write_path

# This works.
# function get_all_files
# {
#     Get-ChildItem -Path $path
# }

# get_all_files

# $path = "C:\Users\$env:USERNAME\AppData\Roaming\mIRC\downloads"
# $path = "C:\Users\$env:USERNAME\Desktop\dropbox_copy"

# function delete_files($Path, $extension)
# {
#     Get-ChildItem -Path $path -recurse -Include *.$extension | remove-item
# }

# delete_files($path, "zip")

# function delete_all_contents 
# {
#     Get-ChildItem -Path C:\Users\$env:USERNAME\AppData\Roaming\mIRC\downloads -Include *.* -File -Recurse | foreach { $_.Delete()}
# }

# This works.
# function remove_files($Path)
# {
#     Get-ChildItem -Path $path *.zip | foreach { Remove-Item -Path $_.FullName }
# }

# remove_files($path)
# *.$extension

# function remove_files($Path, $extension)
# {
#     Get-ChildItem -Path $path $extension | foreach { Remove-Item -Path $_.FullName }
# }

# remove_files($path, "*.zip")

# This works
function remove_files($Path, $extension)
{
    Remove-Item $path\* -Include *.$extension
}

# remove_files $path "zip"
# remove_files $path "epub"

# This works
# function make_get($url)
# {
#     Invoke-WebRequest -Uri $url -Method GET
# }

# make_get("https://www.google.com")

# function make_post($url, $access_token)
# {
#     $headers = @{
#         "Authorization"="Bearer sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8"
#         "Dropbox-API-Arg"='{"path":}'
#     }
# }

# function make_get()
# {
#     curl.exe -X GET https://www.google.com
# }
# make_get

# function make_post($url, $access_token)
# {
#     curl.exe -X POST $url \
#             --header "Authorization: $access_token" \
#             --
# }

# function make_post($file_path, $url, $access_token)
# {
#     $dropbox_api_arg = '{ "path": "' + $url + '", "mode": "add", "autorename": true, "mute": false }'
#     $authorization = $access_token
#     $headers = New-Object "System.Collections.Generic.Dictionary[[String], [String]]"
#     $headers.add("Authorization", $authorization)
#     $headers.add("Dropbox-API-Arg", $dropbox_api_arg)
#     $headers.add("Content-Type", 'application')

#     Invoke-RestMethod -Uri $url -Method Post -InFile $file_path -Headers $headers
# }

# make_post(".", "https://www.dropbox.com/home/Apps/my_ebooks", "Bearer sl.AgrDT4C-ydo4z5v9Xz2BZKOxkhPsmT2c1bErWrIBvAWMocL3K4Sq9CYirjc1SKG2P4-plNHZP2Oc7BXEYvMKYao5GJ_wslGIjvN-9OdSVQCaPOguBhl_RJc-4xz35qxEZLG6ex8")

function read_token()
{
    Get-Content "./.env"
}

# read_token

function make_post($SourceFilePath, $TargetFilePath)
{
    $arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
    $authorization = Get-Content "./.env"
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", $authorization)
    $headers.Add("Dropbox-API-Arg", $arg)
    $headers.Add("Content-Type", 'application/octet-stream')

    Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers

}

# make_post("./file1.txt", "/home/Apps/my_ebooks")



