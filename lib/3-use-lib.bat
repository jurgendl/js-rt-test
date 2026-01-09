@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Create a test consumer project %ESC%[0m
rmdir /s /q "./my-ts-app" >nul 2>&1
mkdir my-ts-app
cd my-ts-app
call npm init -y

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up a local npm registry (Verdaccio) %ESC%[0m
set texttowrite=registry=http://localhost:4873
echo %texttowrite% > .npmrc

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Install own library %ESC%[0m
call npm install @local/my-ts-lib

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Use own library %ESC%[0m
set texttowrite=import { greet } from "@local/my-ts-lib"; console.log(greet("John"));
echo %texttowrite% > index.ts

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m set type=module %ESC%[0m
yq -i ".type = \"module\"" package.json

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m .npmrc %ESC%[0m
@type .npmrc

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m package.json %ESC%[0m
@type package.json

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m index.ts %ESC%[0m
@type index.ts

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Run script using own library %ESC%[0m
call node --experimental-strip-types --no-warnings index.ts

:: after updating library version
:: npm update @local/my-ts-lib

@pause