CURRENT_DIR=`pwd`
DIR="$CURRENT_DIR/$1"
COMMAND='echo -e "\e]0;$BASH_COMMAND\007";echo "$BASH_COMMAND">>'$DIR'/hello.txt'
echo "$COMMAND"
trap "$COMMAND" DEBUG
