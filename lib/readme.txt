requires yq (choco install yq): https://github.com/mikefarah/yq

requires npm (see ../readme.txt)

Verdaccio is used as a local npm package repository ( http://localhost:4873/ )

writes to the sub folder 'my-ts-lib' and 'my-ts-app'

1-prepare-lib.bat (starts Verdaccio - do not close window)
2-publish-lib.bat
3-use-lib.bat
4-cleanup.bat (Verdaccio need to be running)
