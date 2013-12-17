#! /bin/bash


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# setup user environment
export PATH=.:$PATH
export GIT_COMMITTER_NAME="Junyi Xie"
export GIT_COMMITTER_EMAIL="junyi.couchbase@gmail.com"
export GDB_ROOT='/'
export COUCHBASE_NUM_VBUCKETS=4
#export MAX_CONCURRENT_REPS_PER_DOC=32
export XDCR_FAILURE_RESTART_INTERVAL=1
export XDCR_CHECKPOINT_INTERVAL=1000
#export XDCR_OPTIMISTIC_REPLICATION_THRESHOLD=0

# turn off compiler optimization
export CCFLAGS=-O0

