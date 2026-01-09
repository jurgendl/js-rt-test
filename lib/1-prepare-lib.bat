@echo on
@echo Create the TypeScript library

mkdir my-ts-lib
cd my-ts-lib
call npm init -y
call npm install --save-dev typescript
call npx tsc --init --rootDir src --outDir dist --declaration --module ESNext --target ES2019

@echo Write a reusable function
mkdir src
cd src
set texttowrite=export function greet(name: string): string { return `Hello, ${name}!`; }
echo %texttowrite% > index.ts
cd ..

@echo Configure package.json for a library
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

@echo Build the library
call npm run build

@echo Set up a local npm registry (Verdaccio)
set texttowrite=registry=http://localhost:4873
echo %texttowrite% > .npmrc
call npm install -g verdaccio
start http://localhost:4873
call verdaccio
call npm adduser --registry http://localhost:4873

@echo Publish to the local registry
call npm publish --registry http://localhost:4873

@pause