#!/bin/sh

PROJECT_DIR=""

createdb -h localhost tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/createtable.sql tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/createindex.sql tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/delivery01 tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/neworder01 tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/payment01 tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/stocklevel01 tpcc
psql -h localhost -f ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT/etc/sql/postgresql/orderstatus01 tpcc
cd ${PROJECT_DIR}target/tpc-c-0.1-SNAPSHOT-tpc-c/tpc-c-0.1-SNAPSHOT
./load.sh
./run.sh
psql -h localhost tpcc
