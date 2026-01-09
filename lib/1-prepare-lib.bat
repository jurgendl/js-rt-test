@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Create the TypeScript library %ESC%[0m
rmdir /s /q "./my-ts-lib" >nul 2>&1
mkdir my-ts-lib
cd my-ts-lib
call npm init -y
call npm install --save-dev typescript
call npx tsc --init --rootDir src --outDir dist --declaration --module ESNext --target ES2019

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Write a reusable function %ESC%[0m
mkdir src
cd src
set texttowrite=export function greet(name: string): string { return `Hello, ${name}!`; }
echo %texttowrite% > index.ts
set texttowrite=export function greet(name: string): string { return `Hello, ${name}!`; }
echo %texttowrite% > index.ts
set texttowrite=# @local/my-ts-lib
echo %texttowrite% > README.md
echo: >> README.md
set texttowrite=A small reusable TypeScript utility library.
echo %texttowrite% >> README.md
echo: >> README.md
set texttowrite=## Installation
echo %texttowrite% >> README.md
echo: >> README.md
set texttowrite=```bash
echo %texttowrite% >> README.md
set texttowrite=npm install @local/my-ts-lib
echo %texttowrite% >> README.md
set texttowrite=```
echo %texttowrite% >> README.md
cd ..

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Configure package.json for a library %ESC%[0m
::  "name": "@local/my-ts-lib",
::  "type": "module",
::  "main": "dist/index.js",
::  "types": "dist/index.d.ts",
::  "files": ["dist"],
::  "scripts": {
::    "build": "tsc",
::    "prepublishOnly": "npm run build"
::  }
yq -i ".name = \"@local/my-ts-lib\"" package.json
yq -i ".type = \"module\"" package.json
yq -i ".main = \"dist/index.js\"" package.json
yq -i ".types = \"dist/index.d.ts\"" package.json
yq -i ".files = [\"dist\"]" package.json
yq -i ".scripts.build = \"tsc\"" package.json
yq -i ".scripts.prepublishOnly = \"npm run build\"" package.json

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Build the library %ESC%[0m
call npm run build

@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up a local npm registry (Verdaccio) %ESC%[0m
:: Verdaccio Windows location: %USERPROFILE%\AppData\Roaming\verdaccio
:: Verdaccio Windows config location: %USERPROFILE%\AppData\Roaming\verdaccio\config.yaml
:: call npm unpublish @local/my-ts-lib@1.0.0 --registry http://localhost:4873
:: call npm unpublish @local/my-ts-lib --force --registry http://localhost:4873
set texttowrite=registry=http://localhost:4873
echo %texttowrite% > .npmrc
call npm install -g verdaccio
start http://localhost:4873
call verdaccio

@pause