function create_string {
    $words = @()
    Import-Csv -Path .\text.csv | ForEach-Object {$words += $_.Words}
    $output = @()

    foreach ($word in $words | Get-Random -Count 3) 
    {
        $output += $word
    }
    Write-Host "Message for the day: $output."
}
create_string





