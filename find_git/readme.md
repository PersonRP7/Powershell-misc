# C:\\ drive .git containing directory searching script

Usage:

    ./find_git.ps1

Description:

    This script searches for any directory containing .git in the entire C:\\ drive.
    When it's done, it writes its output to a file stored in the directory from which
    it was launched.

Caveats:

    Even though the script works, it throws AccessDenied errors as it runs. The previous
    iteration only returned one AccessDenied error as the -FilePath cmdlet wasn't provided
    with a file name. The current iteration's errors are being tripped up by the Get-ChildItem
    cmdlet and as such they might be related to NTFS junction points.
