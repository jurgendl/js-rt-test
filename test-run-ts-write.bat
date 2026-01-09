@echo off
cls

cd _script
cd _common

echo ==================================

del output1.txt 2>nul
del output2.txt 2>nul
del output3.txt 2>nul
del output4.txt 2>nul
echo on
bun run test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
pause

echo ==================================

del output1.txt 2>nul
del output2.txt 2>nul
del output3.txt 2>nul
del output4.txt 2>nul
echo on
deno run --allow-write test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
pause

echo ==================================

del output1.txt 2>nul
del output2.txt 2>nul
del output3.txt 2>nul
del output4.txt 2>nul
echo on
node --experimental-strip-types --no-warnings test-ts-write.ts
@echo off
type output1.txt 2>nul
type output2.txt 2>nul
type output3.txt 2>nul
type output4.txt 2>nul
pause

echo ==================================

cd..
cd..