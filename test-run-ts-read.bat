@echo off
cls

cd bun
cd vite-project
echo on
bun run test-ts-read.ts
@echo off
cd..
cd..
pause

echo ==================================

cd deno
cd vite-project
echo on
deno run --allow-read test-ts-read.ts
@echo off
cd..
cd..
pause

echo ==================================

cd node
cd vite-project
echo on
node --experimental-strip-types test-ts-read.ts
@echo off
cd..
cd..
pause

echo ==================================