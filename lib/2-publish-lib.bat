@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo:
@echo(%ESC%[38;2;0;0;0;48;2;255;180;0m Set up user in Verdaccio (use test user/mail, use strong pass like %ESC%[38;2;0;0;0;48;2;0;180;255m MyStr0ngPass123$ %ESC%[0m
cd my-ts-lib
::npm config --location=project set registry http://localhost:4873
::npmrc
call npm adduser --registry http://localhost:4873
::npm login --registry http://localhost:4873
pause

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Remove previous published package %ESC%[0m
call npm view @local/my-ts-lib --registry http://localhost:4873 >nul 2>&1
if %ERRORLEVEL%==0 (
  call npm unpublish @local/my-ts-lib --force --registry http://localhost:4873
)

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Publish to the local registry %ESC%[0m
call npm publish --registry http://localhost:4873

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Check package in local registry %ESC%[0m
call npm view @local/my-ts-lib --registry http://localhost:4873

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Bump version to prepare for next release (you can't overwrite packages) %ESC%[0m
call npm version patch

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Open Verdaccio web app for this library %ESC%[0m
start http://localhost:4873/-/web/detail/@local/my-ts-lib

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m It is safe to close this window %ESC%[0m
@pause