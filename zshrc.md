

* Install zsh: `sudo apt-get install zsh`
* Install oh-my-zsh: https://ohmyz.sh/

Content of `~/.zshrc`


```zsh
############################################
# Readme: this will setup zsh
#
# First pls setup vim and oh-my-zsh
# by following https://github.com/yishilin/RickVim
#
# ln -s /Users/rick/local/code/RickVim/_zshrc ~/.zshrc
############################################

# Path to your oh-my-zsh installation.
export ZSH=/Users/rick/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias cdvim="cd /local/code/shilinvim"
#alias vim='/usr/local/Cellar/vim/8.0.0002/bin/vim'
#alias vi='vim'
alias irb='pry'

alias ls='ls -GFh'

alias sshtest='expect -c "spawn ssh root@192.168.0.81; expect \"password\"; send \"123qwe\n\"; interact"'
alias sshmon='expect -c "spawn ssh yishilin@192.168.0.5; expect \"password\"; send \"1moQiche\n\"; interact"'
alias cdhomestead="cd /local/vagrant_boxes/Homestead; vagrant status"
alias sshhomestead="ssh vagrant@127.0.0.1 -p 2222"

alias pingnetwork='ifconfig |grep 192; ping 192.168.20.1'


fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

#----------------------------------
# fasd configuration section
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias c='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias v='f -e vim' # quick opening files with vim
alias o='a -e open' # quick opening files with xdg-open

#----------------

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias e='open /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl '
alias markdown="open -a typora"
alias md=markdown

alias trojan="cd ~/local/tools/trojan; ./trojan &"


alias github2='open -n /Applications/GitHub\ Desktop.app'

export PIPENV_VENV_IN_PROJECT=1


#export PATH="$PATH:/usr/local/lib/ruby/gems/2.6.0/bin"

source ~/.bashrc
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/X11/bin:$PATH"


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#################### Proxy ##################
function ProxyStart() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:10088"
    export https_proxy=$http_proxy
    brew services start privoxy
    echo -e "Started http(s) proxy port:10088 --> socks5:10080"
}

function ProxyClose() {
    brew services stop privoxy
    echo -e "Closed http(s) proxy proxy port:10088 -x> socks5:10080"
    unset http_proxy
    unset https_proxy
}
#################### end ##################
```
