echo -e "\033[1;36m\
##########
 ##
  ##
   #####
  ##
 ##
##########
"

PS1="\[\033[1;36m\]烈\u@\h:\w"
if [ "$(id -u)" = "0" ]; then
	PS1="$PS1 # "
else
	PS1="$PS1 $ "
fi
PS1="$PS1\[\033[0;37m\]"
PS2="\[\033[1;36m\]=> \[\033[0;37m\]"

alias ls="ls --color=auto"

# Fix for Java applications
export _JAVA_AWT_WM_NONREPARENTING=1

