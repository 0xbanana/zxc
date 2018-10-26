#!/bin/bash

ls contracts/ | while read a; do (echo "[FILE]: $a"; docker run -v $(pwd):/tmp luongnguyen/oyente oyente/oyente.py -s /tmp/contracts/$a -ce ); done;
