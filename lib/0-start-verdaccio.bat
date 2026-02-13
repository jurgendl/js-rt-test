@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up a local npm registry (Verdaccio) %ESC%[0m
call npm install -g verdaccio

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Verdaccio locations %ESC%[0m
@echo Verdaccio Windows location: %USERPROFILE%\AppData\Roaming\verdaccio
@echo Verdaccio Windows config location: %USERPROFILE%\AppData\Roaming\verdaccio\config.yaml

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Starting Verdaccio (wait till it shows an url, leave this window open) %ESC%[0m
call verdaccio
