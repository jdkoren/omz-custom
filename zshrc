# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/custom/jdk

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jdk"

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

# Uncomment the following line to display red dots while waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins do we load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mercurial)

source $ZSH/oh-my-zsh.sh

### User configuration ###

# Theme var that stores the PATH before any user configurations modify it.
# sub-scripts are obliged NOT to change this.
if [[ -z "$ZSH_THEME_ORIG_PATH" ]]; then
    export ZSH_THEME_ORIG_PATH="$PATH"
fi

# Reset PATH to what it was before this file was sourced
reset_path () {
    if [[ -n "$ZSH_THEME_ORIG_PATH" ]]; then
        echo "Resetting PATH to \"$ZSH_THEME_ORIG_PATH\""
        export PATH="$ZSH_THEME_ORIG_PATH"
    fi
}

# Function that sub-scripts can use to determine if this is the first time zsh
# is being sourced.
is_first_source() {
    [[ -z "$ZSH_THEME_FIRST_SOURCE_DONE" ]]
}

# In case this isn't the first sourcing, remove this function to avoid resets
# while sub-script is sourcing.
unset -f reset_zsh 2>/dev/null

# Source local configurations file.
if [[ -s "$HOME/.zshlocalrc" ]]; then
    source "$HOME/.zshlocalrc"
fi

declare ZSH_THEME_FIRST_SOURCE_DONE=true

# Reset zsh so that the next source behaves like the first source.
reset_zsh() {
    reset_path
    unset ZSH_THEME_FIRST_SOURCE_DONE
}

### End user configuration ###

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
