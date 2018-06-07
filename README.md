# IndraDB Postgres Implementation [![Docs](https://docs.rs/indradb-postgres/badge.svg)](https://docs.rs/indradb-postgres)

This is an implementation of the IndraDB datastore for postgres. It should
generally be considered by far the slowest datastore implementation available,
however it provides a few major benefits:

* Transaction changes can be rolled back on error.
* Multiple `IndraDB` server processes can run on the same datastore at the same
  time.
* You can use all of the postgres tooling to poke around at the results.
* Thanks to foreign keys et al., this is probably less buggy than other
  implementations.

## Running tests

Run `./test.sh`.

## Running benchmarks

Run `./test.sh --bench`.
