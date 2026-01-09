@echo on

@echo Create a test consumer project
mkdir my-ts-app
cd my-ts-app
call npm init -y

@echo Set up a local npm registry (Verdaccio)
set texttowrite=registry=http://localhost:4873
echo %texttowrite% > .npmrc

@echo Install own library
call npm install @local/my-ts-lib

@echo Use own library
set texttowrite=import { greet } from "@local/my-ts-lib"; console.log(greet("John"));
echo %texttowrite% > index.ts

@echo Run script using own library
yq -i ".type = \"module\"" package.json
call node --experimental-strip-types --no-warnings index.ts

@pause