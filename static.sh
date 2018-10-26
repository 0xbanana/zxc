#!/bin/bash

# Static analyzers for smart contracts 

echo "[Static Tasks]";
echo "Getting all contracts in ./contracts/";
echo "";

ls contracts/*.sol | 
	while read a; 
	do (
		echo "[Found File]: $a";
		echo "";
		echo "Running task oyente"; 
		docker run -v $(pwd):/tmp luongnguyen/oyente oyente/oyente.py -s /tmp/$a -ce > $a_boop;

		echo "--------------------------------------------------------------------"
		echo "\n\nRunning task echidna-test\n"
		docker run -v $(pwd):/tmp trailofbits/echidna echidna-test /tmp/$a;


	); done ;
echo "========ALL STATIC TASKS DONE================="