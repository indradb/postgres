#!/bin/bash

if [ $TRAVIS_OS_NAME = osx ]; then
    rm -rf /usr/local/var/postgres
    initdb /usr/local/var/postgres
    pg_ctl -D /usr/local/var/postgres -w start
    createuser -s postgres
fi

dropdb --if-exists indradb_test
createdb --owner=$PG_USER indradb_test

source ~/.cargo/env || true
