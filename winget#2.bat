winget uninstall "microsoft teams"
winget uninstall "OneDrive"
winget uninstall "Microsoft OneDrive"
winget upgrade Microsoft.AppInstaller
winget update --all --silent
winget upgrade --all --silent
winget install --silent -e --id Google.Chrome
winget install --silent -e --id 7zip.7zip
winget install --silent -e --id Adobe.Acrobat.Reader.64-bit
winget install --silent -e --id Notepad++.Notepad++
winget install --id=Microsoft.Office  -e
timeout 2 >nul
exit
