Couple of scripts to build opencog in controlled environment.


Build container using your `uid` and `gid`:
```
docker build --build-arg=EXT_UID=`id -u` --build-arg=EXT_GID=`id -g` -t opencog:latest .
```

Edit `run.sh` before starting to change host path to the project directory.

To start run:
```sh
./run.sh
```

