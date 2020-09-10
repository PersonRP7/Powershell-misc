$words = @(
    "hello", "sunset", "plane", "birds",
    "lemon", "ship", "zip", "settings",
    "manticore", "firehawk", "fringes",
    "fleur-de-lis", "easy", "warbird"
)

# $output = @()
function create_string()
{
    $output = @()
    foreach ($word in $words | Get-Random -Count 3)
    {
        $output += $word
    }
    Write-Host "Message for the day: $output."
}

create_string

