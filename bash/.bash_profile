#! /bin/bash


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

#export COUCHBASE_NUM_VBUCKETS=4
#export MAX_CONCURRENT_REPS_PER_DOC=32
#export XDCR_FAILURE_RESTART_INTERVAL=1
#export XDCR_CHECKPOINT_INTERVAL=1000
#export XDCR_OPTIMISTIC_REPLICATION_THRESHOLD=0


# setup user environment
export PATH=.:$PATH
export GIT_COMMITTER_NAME="Junyi Xie"
export GIT_COMMITTER_EMAIL="junyi.xie@yahoo.com"
export GDB_ROOT='/'

## KV store dir, must be local
export KVROOT='/var/tmp/kvroot'
export KVHOME='/Users/junyi/work/oracle/hg/kv/kvstore'
export KVTEST=$KVHOME/test
export KVLIB='/Users/junyi/work/oracle/hg/kv/kvstore/dist/lib'
export CLASSPATH=.:$KVLIB:$KVLIB/kvstore.jar:$KVLIB/kvclient.jar:$KVHOME/examples/:$CLASSPATH

# turn off compiler optimization
export CCFLAGS=-O0
