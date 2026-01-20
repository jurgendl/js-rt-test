::run in Win Powershell
::irm https://deno.land/install.ps1 | iex

::run in Win command prompt: force Powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
	"irm https://deno.land/install.ps1 -OutFile deno-install-tmp.ps1; .\deno-install-tmp.ps1"
@del .\deno-install-tmp.ps1

@pause