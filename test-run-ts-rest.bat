@echo off
cls

cd _script
cd _common

echo ==================================

echo on
bun run test-ts-rest.ts
@echo off
pause

echo ==================================

echo on
deno run --allow-net test-ts-rest.ts
@echo off
pause

echo ==================================

echo on
node --experimental-strip-types --no-warnings test-ts-rest.ts
@echo off
pause

echo ==================================

cd..
cd..