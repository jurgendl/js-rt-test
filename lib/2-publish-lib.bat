@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up user in Verdaccio (use test user/pass/mail) %ESC%[0m
cd my-ts-lib
call npm adduser --registry http://localhost:4873

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print .npmrc %ESC%[0m
@type .npmrc

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print package.json %ESC%[0m
@type package.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print tsconfig.json %ESC%[0m
@type tsconfig.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print README.md %ESC%[0m
@type README.md

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print src/index.ts %ESC%[0m
@type src\index.ts

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Remove previous published package %ESC%[0m
call npm unpublish @local/my-ts-lib --force --registry http://localhost:4873

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Publish to the local registry %ESC%[0m
call npm publish --force --registry http://localhost:4873
::call yarn publish --registry http://localhost:4873
::call bun publish --registry http://localhost:4873

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Bump version (because you normally can't overwrite packages) %ESC%[0m
call npm version patch

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Open Verdaccio web app for this library %ESC%[0m
start http://localhost:4873/-/web/detail/@local/my-ts-lib
::http://localhost:4873/@local/my-ts-lib/-/my-ts-lib-1.0.1.tgz

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m It is safe to close this window %ESC%[0m
@pause