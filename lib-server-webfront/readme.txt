lib-dual-package-build is a library used both in vite web frontend and node server backend using a dual package build
build deploys to dist/node and dist/browser using tsconfig.node.json/tsconfig.browser.json respectively and ran by build:node/build:browser respectively (build combines both)
MARK the imports (and exports) use .js

library package.json => configures which folder is used for each consumer 

	"exports": {
		".": {
			"types": "./dist/node/lib.d.ts",
			"import": {
				"node": "./dist/node/lib.js",
				"browser": "./dist/browser/lib.js",
				"default": "./dist/browser/lib.js"
			}
		}
	},

Node uses order:
	node
	import
	default
Bundlers use order:
	browser
	import
	default

seperate code is needed when ...
	Node version uses fs, path, crypto, etc.
	Browser version uses window, fetch, etc.


the frontend was initialized by using "yarn create vite", vanilla, Typescript

on any code change, run, builds libs, removes and readds libs in both project via path dependency:
	lib-dual-package-build.bat

test server dev/build
	node-project-dev.bat
	node-project-build.bat

test web-client dev/build
	vite-project-dev.bat
	vite-project-build.bat
