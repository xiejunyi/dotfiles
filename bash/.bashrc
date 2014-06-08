#===============================================================
#
# ALIASES AND FUNCTIONS
#

#===============================================================

#-------------------
# Personnal Aliases
#-------------------

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'
alias dir='ls -lrt | grep drw '
alias dirr='ls -lrat | grep drw '
alias lrt='ls -lrt'
alias lrat='ls -lrat'
alias mygrep='grep -n'
alias prettyjson='python -mjson.tool'
alias jps='jps -lvm'
## unused/retired alias
#alias findcrash='grep -A 15 -n -r --include debug.* CRASH . | less'
#alias print='/usr/bin/lp -o nobanner -d $LPDEST'
#alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias cscope='cscope -RC'
#alias repoinit='repo init -u git://github.com/membase/manifest.git -m branch-2.0.1.xml'
#alias smalldata='/Users/junyi/work/mcsoda/mcsoda.py localhost:12001 doc-gen=0 doc-cache=0 ratio-creates=1 ratio-sets=1 ratio-deletes=0 min-value-size=16 max-items=100000 exit-after-creates=1 prefix=100K'

#-------------------------------------------------------------
# File & string-related functions:
#-------------------------------------------------------------
# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

## Find file with string
function fs(){ find . -type f -exec grep -l $1 {} + ; }

# Find a pattern in a set of files and highlight them:
# (needs a recent version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
#   xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more 
    xargs -0 egrep -sn ${case} "$1" 2>&- | more 
}


#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------
function myps() { ps $@ -u $USER -o user,pid,ppid,%cpu,%mem,command ; }
function pp() { myps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }
##function couchps() { myps | grep '/Users/junyi/work' | grep -v 'grep'; }

function killps()                 # Kill by process name.
{
    local pid pname sig="-TERM"   # Default signal.
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(myps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
        pname=$(myps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

function my_ip() # Get IP adresses.
{
    MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | \
sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | \
sed -e s/P-t-P://)
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo
}
