requires yq (choco install yq): https://github.com/mikefarah/yq

requires npm (see ../readme.txt)

Verdaccio is used as a local npm package repository ( http://localhost:4873/ )

1-prepare-lib.bat (starts Verdaccio - do not close window)
	Create the TypeScript library
	Create README.md
	Write a reusable function in TS
	Configure package.json for a library
	Build the library
	Set up a local npm registry (Verdaccio)
	Start Verdaccio (leave this windows running)

2-publish-lib.bat
	Set up user in Verdaccio (use test user/pass/mail)
	Print all files
		.npmrc
		package.json
		tsconfig.json
		README.md
		src/index.ts
	Remove previous published package (ignore errors)
	Publish to the local registry
	Bump version (because you normally can't overwrite packages)

3-use-lib.bat
	Create a test consumer project
	Set up a local npm registry (Verdaccio)
	Install own library
	Use own library
	Set type to module in package.json
	Print all files
		.npmrc
		package.json
		src/index.ts
	Run script using own library

4-cleanup.bat (Verdaccio need to be running)
	Remove package from Verdaccio
	Clean up folders
