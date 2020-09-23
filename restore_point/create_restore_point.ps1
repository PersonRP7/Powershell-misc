$dt_string = "$((Get-Date).Year)_$((Get-Date).Month)_$((Get-Date).Day):$((Get-Date).Hour):$((Get-Date).Minute):$((Get-Date).Second)_restore_point"

function create_restore_point {
    Checkpoint-Computer -Description $dt_string
}
# create_restore_point