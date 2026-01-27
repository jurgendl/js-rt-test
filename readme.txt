nvm (node version manager): https://github.com/nvm-sh/nvm
runtime: https://nodejs.org/en
runtime: https://docs.deno.com/runtime/getting_started/installation/
runtime: https://bun.com/docs/installation
package manager: https://www.npmjs.com/
package manager: https://yarnpkg.com/	, https://yarnpkg.com/getting-started/install

----------------------------------------------

install nvm-setup.exe from https://github.com/coreybutler/nvm-windows/releases

available versions:
nvm list available

version local:
nvm list

install version:
nvm install VERSION

activate version glabally:
nvm use VERSION

uninstall version:
nvm uninstall VERSION

----------------------------------------------

update
see nvm

start new project:
npm init

create from package:
npm create PACKAGE

install global package:
npm install --global PACKAGE

install project development package:
npm install --save-dev PACKAGE

install project package:
npm install PACKAGE

uninstall project package:
npm uninstall PACKAGE

run package.json script:
npm run SCRIPT

run typescript:
node --experimental-strip-types TYPESCRIPT

----------------------------------------------

update
todo

start new project:
yarn

create from package:
yarn create PACKAGE

install global package:
yarn global add PACKAGE

install project development package:
yarn add --dev PACKAGE

install project package:
yarn add PACKAGE

uninstall project package:
yarn remove PACKAGE

run package.json script:
yarn run SCRIPT

----------------------------------------------

powershell -c "irm https://deno.land/install.ps1 | iex"

update
deno upgrade

start new project:
deno init

create from package:
deno init -t PACKAGE

install global package:
deno install -g PACKAGE

install project development package:
deno add -D PACKAGE

install project package:
deno add PACKAGE

uninstall project package:
deno remove PACKAGE

run package.json script:
deno task SCRIPT

run typescript:
deno run --FLAGS TYPESCRIPT

----------------------------------------------

powershell -c "irm bun.sh/install.ps1|iex"

update
todo

start new project:
bun init

create from package:
bun create PACKAGE

install global package:
bun add --global PACKAGE

install project development package:
bun add -d PACKAGE

install project package:
bun add PACKAGE

uninstall project package:
bun remove PACKAGE

run package.json script:
bun run SCRIPT

run typescript:
bun run TYPESCRIPT

----------------------------------------------

https://vite.dev/guide/

create vite project:

npm create vite@latest
yarn create vite

deno init --npm vite

bun create vite

----------------------------------------------
