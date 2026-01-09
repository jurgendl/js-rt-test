@echo off
cls

cd _script
cd _common

echo ==================================

echo on
bun run test-ts.ts
@echo off
pause

echo ==================================

echo on
deno run test-ts.ts
@echo off
pause

echo ==================================

echo on
node --experimental-strip-types test-ts.ts
@echo off
pause

echo ==================================

cd..
cd..