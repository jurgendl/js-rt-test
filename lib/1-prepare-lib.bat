@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Create the TypeScript library %ESC%[0m
rmdir /s /q "./my-ts-lib" >nul 2>&1
mkdir my-ts-lib
cd my-ts-lib
call npm init -y
call npm install --save-dev typescript
call npx tsc --init --rootDir src --outDir dist --declaration --module ESNext --target ES2019
call npm install --save-dev typedoc typedoc-plugin-markdown
copy ..\template_README.md_template README.md
copy ..\template_typedoc.json_template typedoc.json
mkdir src
copy ..\template_index.ts_template src\index.ts
mkdir scripts
copy ..\template_sync-readme.mjs_template scripts\sync-readme.mjs

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Configure package.json for a library %ESC%[0m
yq --inplace ".author = \"author name\"" package.json
yq --inplace ".name = \"@local/my-ts-lib\"" package.json
yq --inplace ".type = \"module\"" package.json
yq --inplace ".main = \"dist/index.js\"" package.json
yq --inplace ".keywords = [\"keyword\"]" package.json
yq --inplace ".types = \"dist/index.d.ts\"" package.json
yq --inplace ".files = [\"dist\",\"docs\"]" package.json
yq --inplace ".scripts.build = \"tsc\"" package.json
yq --inplace ".scripts.prepublishOnly = \"npm run build\"" package.json
set "packjsonscript=npm view @local/my-ts-lib --registry http://localhost:4873 ^>NUL 2^>NUL ^&^& npm unpublish @local/my-ts-lib --force --registry http://localhost:4873"
yq --inplace ".scripts.cleanLocalRegistry = \"%packjsonscript%\"" package.json
yq --inplace ".scripts.upVersion = \"npm version patch\"" package.json
yq --inplace ".scripts.publishToLocalRegistry = \"npm publish --registry http://localhost:4873\"" package.json
yq --inplace ".scripts.docs = \"typedoc --out docs\"" package.json
yq --inplace ".scripts.readmeSync = \"node scripts/sync-readme.mjs\"" package.json
yq --inplace "del(.scripts.test)" package.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Build the library %ESC%[0m
call npm run build
call npm run readmeSync

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Set up a local npm registry (Verdaccio) %ESC%[0m
:: Verdaccio Windows location: %USERPROFILE%\AppData\Roaming\verdaccio
:: Verdaccio Windows config location: %USERPROFILE%\AppData\Roaming\verdaccio\config.yaml
:: call npm unpublish @local/my-ts-lib@1.0.0 --registry http://localhost:4873
:: call npm unpublish @local/my-ts-lib --force --registry http://localhost:4873
call npm install -g verdaccio
cd ..

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Starting Verdaccio (leave this window running) %ESC%[0m
call verdaccio
