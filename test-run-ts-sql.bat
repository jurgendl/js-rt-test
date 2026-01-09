@echo off
cls

cd _script

echo ==================================

cd bun
echo on
bun run test-ts-sql.ts
@echo off
cd..
pause

echo ==================================

cd deno
echo on
deno add jsr:@db/sqlite
deno run --allow-net --allow-ffi --allow-write --allow-read --allow-env test-ts-sql.ts
@echo off
cd..
pause

echo ==================================

cd node
echo on
node --experimental-strip-types test-ts-sql.ts
@echo off
cd..
pause

echo ==================================

cd..