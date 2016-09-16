ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[003]%}±"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_MERGING="%{$FG[219]%} M"
ZSH_THEME_GIT_PROMPT_REBASING="%{$FG[219]%} R"
ZSH_THEME_GIT_PROMPT_BISECTING="%{$FG[219]%} B"
ZSH_THEME_GIT_PROMPT_CHERRYPICKING="%{$FG[219]%} C"

ZSH_SPECTRUM_TEXT="To iterate is human; to recurse, divine"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="gxagfxfacxbabagegchchd"
export LS_COLORS="di=36;40:ln=0;46:so=35;40:pi=35;40:ex=32;40:bd=31;40:cd=31;40:su=36;44:sg=36;42:tw=37;42:ow=37;43:"

local status_indicator="%(?|%{$FG[010]%}%# |%{$FG[009]%}%# )"
PROMPT="%B%{$FG[045]%}%n %{$FG[011]%}%~$status_indicator%{$reset_color%}%B"
RPROMPT='%{$FG[011]%}$(parse_git_state)%{$reset_color%}'
