#Outputs "docker image ls" to a file called "docker_data"
function images_readout {
    docker image ls > docker_data
}

#Removes the "docker_data" file from the current directory,
#ie. the directory the rmi function is called from.
function delete_docker_data {
    Remove-Item docker_data
}

#Returns the id of the latest docker image
function return_image_id {
    Get-Content docker_data | Foreach {($_ -split '\s+',4)[0..2]} | select-object -Index 5
}

#Stores the id of the latest docker image then passes it to
#be deleted by docker's rmi command.
function delete_image {
    $image_id = return_image_id
    docker rmi $image_id
}

# Runs the above functions in the correct order and finally deletes the file.
function rmi {
    images_readout
    delete_image
    delete_docker_data
}