#!/bin/bash
set -e

psql <<-EOSQL
    create user oodbu with password 'oodbpasswd';
    create database oodb with owner oodbu;
EOSQL

psql oodb -U oodbu <<-EOSQL
    \i /tmp/setupDatabase.sql;
EOSQL