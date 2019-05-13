#!/bin/bash

abspath=/home/abc/share/filesig

cd $abspath/src

javac -verbose -cp .:../lib/postgresql-42.2.5.jar:../lib/commons-csv-1.6/commons-csv-1.6.jar:../lib/commons-io-2.6/commons-io-2.6.jar  ./app/filesig/FileSigDB.java 

#javac -cp .:../lib/postgresql-42.2.5.jar  Create.java 
#javac -cp .:../lib/postgresql-42.2.5.jar  Insert.java 

cd $abspath

#place build class files in the folder
#-d

#add verbose argument to the above if requierd
#-verbose
