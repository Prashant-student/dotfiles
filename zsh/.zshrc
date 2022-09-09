# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#source ~/.bash_profile
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="minimal"
# ZSH_THEME="alanpeabody"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim='nvim'
alias astudio="~/android-studio/bin/studio.sh"
alias ls='exa -la'
alias cat='bat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
path+=('/home/prashant/.local/bin')
export PATH

#functions
fcd(){
    cd "$(fd --type d | fzf)"
}

open(){
    xdg-open "$(fd --type f | fzf)"
}

get(){
    fd --type f | fzf | sed 's/^..//g'| tr -d '/n' | xclip -selection c
}

fvim(){
    nvim "$(fd --type f | fzf)"
}

dvim(){
    nvim "$(fd --type d | fzf)"
}
fcode(){
    code "$(fd --type f | fzf)"
}

dcode(){
    code "$(fd --type d | fzf)"
}
vimdot(){
   nvim ~/dotfiles
}
vimzsh(){
   nvim ~/dotfiles/zsh/zshrc
}

pcd(){
    cd "/home/prashant/projects/$(ls ~/projects | fzf)"
}

prog(){
    cd "/home/prashant/projects/"
    local name="$(fd -d 2 -t d | cut -c 3- | fzf)"
    code $name
    cd $name
    tmux
}

comp(){
    cd "/home/prashant/code/competitive/"
    local name="$(fd -d 2 -t d | cut -c 3- | fzf)"
    code $name
    cd $name
    tmux
}
compyou(){
    local name="/home/prashant/code/competitive/youtube/$(ls ~/code/competitive/youtube | fzf)"
    code $name
    cd $name
    tmux
}
push(){
    git add .
    git commit -m "$1"
    git push
}
watch()
{
    while inotifywait --exclude .swp -e modify -r .; do $@; done;
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/prashant/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/prashant/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/prashant/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/prashant/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# /home/prashant/Downloads/commandlinetools-linux-8092744_latest/cmdline-tools/bin
#export PATH="/home/prashant/clones/flutter/bin:$PATH"
export PATH="/opt/android-sdk/cmdline-tools/custom/bin:$PATH"
#export PATH="/home/prashant/Downloads/commandlinetools-linux-8092744_latest/cmdline-tools/bin:$PATH"

#Hadoop Related Options
export HADOOP_HOME=/home/prashant/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

export HDFS_NAMENODE_USER="prashant"
export HDFS_DATANODE_USER="prashant"
export HDFS_SECONDARYNAMENODE_USER="prashant"
export YARN_RESOURCEMANAGER_USER="prashant"
export YARN_NODEMANAGER_USER="prashant"
#export HADOOP_OPTS"-Djava.library.path=$HADOOP_HOME/lib/nativ"
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

export GOBIN=/home/prashant/go/gobin


# pnpm
export PNPM_HOME="/home/prashant/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/prashant/.julia/juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
