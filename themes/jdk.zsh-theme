ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[003]%}±"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_MERGING="%{$FG[219]%} M"
ZSH_THEME_GIT_PROMPT_REBASING="%{$FG[219]%} R"
ZSH_THEME_GIT_PROMPT_BISECTING="%{$FG[219]%} B"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="gxagfxfacxbabagegchchd"
export LS_COLORS="di=36;40:ln=0;46:so=35;40:pi=35;40:ex=32;40:bd=31;40:cd=31;40:su=36;44:sg=36;42:tw=37;42:ow=37;43:"

PROMPT="%B%{$FG[009]%}jdkoren %{$FG[011]%}%~ : %B%{$reset_color%}"
RPROMPT='%p $(parse_git_state)%{$reset_color%}'
