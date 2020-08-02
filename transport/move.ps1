$format = $args[0]
$current = $args[1]
$destination = $args[2]

function transport {
    Get-ChildItem -Path $current -Include $format -Recurse | Copy-Item -Destination $destination
    
}

transport
