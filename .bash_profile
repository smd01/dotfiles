# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

################################## GIT,  ######################################
# Set up prompt
export PS1='\[\e[1;37m\]\D{%F %T} \[\e[0m\]\[\e[1;32m\][\u@\h \[\e[0;34m\]$(__git_ps1 " (%s $(get_sha)) ") \[\e[0m\]\[\e[0;36m\]\w\[\e[0m\]\[\e[1;32m\]] \[\e[0m\]\n \[\e[1;33m\]\$\[\e[0m\] '

# Git Stuff
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1 # Explicitly unset color (default). Use 1 to set it.
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

get_dir() {
        printf "%s" $(pwd | sed "s:$HOME:~:")
}
get_sha() {
        git rev-parse --short HEAD 2>/dev/null
}

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gca='git add --all && git commit'
alias gd='git diff'
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gf='git fetch'
alias gp='git pull'

################################ Other Stuff #########################
# Aliases are only expanded as the first argument, or after another alias with a trailing space on the end of the command.
alias watch="watch "

alias vim="/usr/local/Cellar/vim/8.0.0329/bin/vim"

alias sessions="ps auxw |grep '[s]sh' | awk '{print \$1, \$2, \$9, \$11, \$13}'"
alias tunnels="ps auxw |grep '[s]sh -fNT' | awk '{print \$1, \$2, \$9, \$11, \$13}'"

alias randpass='openssl rand -base64 32'

#bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
    fi

# Add timestamps to history
export HISTTIMEFORMAT="%d/%m/%y %T "

# UTC conversion
alias utc='date +%z'

# lazy
alias ll='ls -lah'

# Color ls
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Color grep
export GREP_OPTIONS="--color=auto"

# AWS CLI auto-complete
complete -C '/usr/local/bin/aws_completer' aws
export PATH=/usr/local/bin/aws:$PATH

# autoenv
source /usr/local/opt/autoenv/activate.sh

# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# rbenv
#[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

# Homebrew github token
export HOMEBREW_GITHUB_API_TOKEN=""

### CHEF
#knife.rb wants to know what my editor is
export EDITOR='/usr/bin/vim'
# Use Chef's ruby instead of system ruby
eval "$(chef shell-init bash)"
# knife auto-complete
source ${HOME}/workspace/knife-bash-autocomplete/knife_autocomplete.sh
# Specify which environment(i.e. /env-n/knife.rb) knife should use. 
knife-sfo() { knife $* -c ~/.chef/env-n/knife.rb; }


### Paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin
export PATH=/usr/local/sbin:$PATH
export PATH=~/.chefdk/gem/ruby/2.1.0/bin:$PATH
export PATH="/opt/chefdk/embedded/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export JAVA_HOME="/usr/bin/java"
