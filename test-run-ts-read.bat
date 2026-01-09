@echo off
cls

cd _script
cd _common

echo ==================================

echo on
bun run test-ts-read.ts
@echo off
pause

echo ==================================

echo on
deno run --allow-read test-ts-read.ts
@echo off
pause

echo ==================================

echo on
node --experimental-strip-types test-ts-read.ts
@echo off
pause

echo ==================================

cd..
cd..