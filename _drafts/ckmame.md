[Homepage](https://www.nih.at/ckmame/)

```
$ wget https://www.nih.at/ckmame/ckmame-0.12.tar.gz
$ tar xzvf ckmame-0.12.tar.gz
$ cd ckmame-0.12
$ ./configure  # failed, needed to run: brew install libzip
$ make
```

```
$ mame -listxml | ./src/mkmamedb
$ sqlite3 mame.db
```
