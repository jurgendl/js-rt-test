@echo off
cls

cd bun
cd vite-project
echo on
bun run test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
cd..
cd..
pause

echo ==================================

cd deno
cd vite-project
echo on
deno run --allow-write test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
cd..
cd..
pause

echo ==================================

cd node
cd vite-project
echo on
node --experimental-strip-types test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
cd..
cd..
pause

echo ==================================