#!/bin/bash

abspath=/home/abc/share/filesig

cd $abspath/src

java -cp .:../lib/postgresql-42.2.5.jar:../lib/commons-csv-1.6/commons-csv-1.6.jar:../lib/commons-io-2.6/commons-io-2.6.jar:./app/filesig/*  app.filesig.FileSigDB 

cd $abspath
