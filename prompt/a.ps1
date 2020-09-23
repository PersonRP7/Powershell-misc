function change_password {
    # Code you've already written... 
}
function query_number()
{
    $query_user = Read-Host "Tell me the number."
    $query_AD = Get-Aduser -properties $query_user
    if ($query_AD) {
        change_password
    }else{
        # If it doesn't match then the function calls itself recursively until it does match.
        query_number 
        # Or do something else...
    }

}
query_number