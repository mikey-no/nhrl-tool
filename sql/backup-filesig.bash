#!/bin/bash

echo --
echo -- Schema only!!
echo --

abspath=/home/abc/share/filesig

cd $abspath/sql

#backup database schema
# +%F date nicley
# %H hours in 24 hour clock
# %m minutes
# %S seconds - note this is upper case S for seconds not seconds since epoch
dt=$(date +%F-%H-%m-%S)

#pd-dump
# -U datebase user
# -h host of the database server
# -d database to backup
# --schema-only like it suggets
pg_dump -U postgres -h localhost -d filesig --schema-only > filesig.$dt.schemaonly.bak 

