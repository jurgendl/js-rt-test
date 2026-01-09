@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up a local npm registry (Verdaccio) %ESC%[0m
cd my-ts-lib
call npm adduser --registry http://localhost:4873

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Publish to the local registry %ESC%[0m
call npm publish --registry http://localhost:4873
::yarn publish
::bun publish --registry http://localhost:4873

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Bump version %ESC%[0m
call npm version patch

@pause