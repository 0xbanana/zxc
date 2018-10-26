#!/bin/bash

ls contracts/*.sol | 
	while read a; 
	do (
		echo "[FILE]: $a"; 
		docker run -v $(pwd):/tmp luongnguyen/oyente oyente/oyente.py -s /tmp/$a -ce;
		docker run -v $(pwd):/tmp trailofbits/echidna echidna-test /tmp/$a;
	); done;
