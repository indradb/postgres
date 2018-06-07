//! The postgres datastore implementation.
//!
//! This should generally be considered by far the slowest implementation,
//! however it provides a few major benefits:
//!
//! * Transaction changes can be rolled back on error.
//! * Multiple `IndraDB` server processes can run on the same datastore at the
//!   same time.
//! * You can use all of the postgres tooling to poke around at the results.
//! * Thanks to foreign keys et al., this is probably less buggy than other
//!   implementations.

extern crate chrono;
#[macro_use]
extern crate indradb;
extern crate num_cpus;
extern crate postgres;
extern crate r2d2;
extern crate r2d2_postgres;
extern crate serde_json;
extern crate uuid;

mod datastore;
mod instance;
mod schema;
mod util;

pub use self::datastore::{PostgresDatastore, PostgresTransaction};

use indradb::tests;

#[cfg(feature = "bench-suite")]
full_bench_impl!(instance::datastore());

#[cfg(feature = "test-suite")]
full_test_impl!(instance::datastore());
