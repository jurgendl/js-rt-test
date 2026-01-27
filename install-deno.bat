@echo run in Win Powershell
@echo "irm https://deno.land/install.ps1 | iex"
@echo or continue
@pause
powershell ^
  -NoProfile ^
  -NonInteractive ^
  -ExecutionPolicy Bypass ^
  -Command ^
  "$ProgressPreference='SilentlyContinue'; $ErrorActionPreference='Stop'; irm https://deno.land/install.ps1 -UseBasicParsing -OutFile deno-install-tmp.ps1; powershell -NoProfile -ExecutionPolicy Bypass -File .\deno-install-tmp.ps1; Remove-Item deno-install-tmp.ps1 -Force"
@pause