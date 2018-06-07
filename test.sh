#!/bin/bash

set -e

PG_USER='postgres'
UNAME_STR=`uname`
if [[ "$UNAME_STR" == 'Darwin' ]]; then
    PG_USER=`whoami`
    echo "Using user '${PG_USER}' for postgres"
fi

export RUST_BACKTRACE=1
export TEST_POSTGRES_URL="postgres://${PG_USER}@localhost:5432/indradb_test"

ACTION=test

while true; do
    case "$1" in
        --bench) ACTION=bench; shift ;;
        * ) break ;;
    esac
done

dropdb --if-exists indradb_test
createdb --owner=$PG_USER indradb_test
cargo update

if [ "$ACTION" == "test" ]; then
    cargo test --features=test-suite $TEST_NAME
else
    cargo +nightly bench --features=bench-suite $TEST_NAME
fi
