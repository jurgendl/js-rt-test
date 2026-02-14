@cd lib-dual-package-build
call npm run build
@cd..
@cd node-project
call yarn remove lib-dual-package-build
call yarn add ../lib-dual-package-build
@cd ..
@cd vite-project
call yarn remove lib-dual-package-build
call yarn add ../lib-dual-package-build
@cd ..
@pause