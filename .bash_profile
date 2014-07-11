#! /bin/bash


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

#--------------------
# Setup Environment
#--------------------
# ant
export ANT_ARGS="-Dgwtc.not.needed=1 -Declipse.jar=/Applications/eclipse/plugins/org.eclipse.jdt.core_3.9.2.v20140114-1555.jar"
# emacs
export EDITOR=emacs
export VISUAL=emacs
# gdb
export GDB_ROOT='/'
# git
export GIT_COMMITTER_NAME="Junyi Xie"
export GIT_COMMITTER_EMAIL="junyi.xie@yahoo.com"
export GIT_EDITOR=emacs
# kvstore, dir must be local
export KVROOT='/var/tmp/kvroot'
export KVHOME='/Users/junyi/work/oracle/hg/kv/kvstore'
export KVTEST=$KVHOME/test
export KVLIB='/Users/junyi/work/oracle/hg/kv/kvstore/dist/lib'
# java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=.:/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:${JAVA_HOME}/bin
export CLASSPATH=.:$KVHOME:$KVLIB:$KVLIB/kvstore.jar:$KVLIB/kvclient.jar:$KVHOME/lib/kv-external/ojdbc6.jar\
:$KVHOME/examples/:$KVHOME/build/examples/classes:$KVHOME/build/classes/:$CLASSPATH
# maven
export MAVEN_OPTS="-Xms256m -Xmx512m"
# hadoop
export PATH=$PATH:/usr/local/Cellar/hadoop/2.4.0/bin:/usr/local/Cellar/hadoop/2.4.0/sbin:

# turn off compiler optimization
export CCFLAGS=-O0


#-------------------
# Personnal Aliases
#-------------------
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias classpath='echo -e ${CLASSPATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'
alias dir='ls -lrt | grep drw '
alias dirr='ls -lrat | grep drw '
alias lrt='ls -lrt'
alias lrat='ls -lrat'
alias grep='grep -n'
alias prettyjson='python -mjson.tool'
alias jps='jps -lvm'
alias cscope='cscope -RC'
alias runadmin='~/memo/oracle/runadmin.sh'
alias kvping='~/memo/oracle/kvping.sh'

#alias repoinit='repo init -u git://github.com/membase/manifest.git -m branch-2.0.1.xml'

