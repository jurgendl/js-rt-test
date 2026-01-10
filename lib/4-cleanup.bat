@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Remove package from Verdaccio %ESC%[0m
cd my-ts-app
:: Verdaccio Windows location: %USERPROFILE%\AppData\Roaming\verdaccio
:: Verdaccio Windows config location: %USERPROFILE%\AppData\Roaming\verdaccio\config.yaml
::packages:
::  '@local/*':
::    access: $all
::    publish: $authenticated
::    unpublish: $authenticated
:: call npm unpublish @local/my-ts-lib@1.0.0 --registry http://localhost:4873
call npm unpublish @local/my-ts-lib --force --registry http://localhost:4873
cd ..

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Clean up folders %ESC%[0m
rmdir /s /q "./my-ts-app" >nul 2>&1
rmdir /s /q "./my-ts-lib" >nul 2>&1

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m You can close Verdaccio now %ESC%[0m
@pause