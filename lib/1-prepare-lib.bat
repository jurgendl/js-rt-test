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
copy ..\template\README.md README.md
copy ..\template\typedoc.json typedoc.json
mkdir src
copy ..\template\src\index.ts .\src\index.ts
copy ..\template\src\lib-extra.ts .\src\lib-extra.ts
mkdir scripts
copy ..\template\scripts\sync-readme.mjs .\scripts\sync-readme.mjs

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

::@echo:
::@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Configure tsconfig.json for a library %ESC%[0m
::call npm install --save-dev jsonc-parser
::node -e "const fs=require('fs');console.log(JSON.stringify(require('jsonc-parser').parse(fs.readFileSync('tsconfig.json','utf8')),null,2))" > tsconfig-clean.json
::del tsconfig.json
::ren tsconfig-clean.json tsconfig.json
::yq --inplace ".compilerOptions.moduleResolution = \"NodeNext\"" tsconfig.json
::yq --inplace ".compilerOptions.module = \"NodeNext\"" tsconfig.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print package.json %ESC%[0m
@type package.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print tsconfig.json %ESC%[0m
@type tsconfig.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print typedoc.json %ESC%[0m
@type typedoc.json

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print README.md %ESC%[0m
@type README.md

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print src/index.ts %ESC%[0m
@type src\index.ts

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Print src/lib-extra.ts %ESC%[0m
@type src\lib-extra.ts

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Build the library %ESC%[0m
call npm run build

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Build the docs %ESC%[0m
call npm run readmeSync

@echo:
@echo %ESC%[38;2;0;0;0;48;2;255;180;0m Create tarball %ESC%[0m
call npm pack

cd ..
