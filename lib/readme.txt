requires yq (choco install yq): https://github.com/mikefarah/yq

requires npm (see ../readme.txt)

Verdaccio is used as a local npm package repository ( http://localhost:4873/ )

writes to the sub folder 'my-ts-lib' and 'my-ts-app'

0-start-verdaccio.bat (prepares and starts Verdaccio - do not close window)
1-prepare-lib.bat
2-publish-lib.bat
3-use-lib-registry.bat (use Verdaccio)
3-use-lib-local-path.bat (use local path source)
3-use-lib-local-tarball.bat (use tarball)
4-cleanup.bat (Verdaccio need to be running)

extra:
5-run-verdaccio.bat (starts Verdaccio - do not close window)
6-open-verdaccio.bat (open Verdaccio in browser)