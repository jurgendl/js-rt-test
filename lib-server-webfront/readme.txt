lib-dual-package-build is a library used both in vite web frontend and node server backend using a dual package build, MARK the imports (and exports) use .js

the frontend was start by using "yarn create vite", vanilla, Typescript, the library and node backend have custom package/typescript config

on any code change, run:
lib-dual-package-build.bat

start server dev/build
node-project-dev.bat / node-project-build.bat

start webfront dev/build
vite-project-dev.bat / vite-project-build.bat