# For git plugin
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[214]%}±"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_MERGING="%{$FG[219]%} M"
ZSH_THEME_GIT_PROMPT_REBASING="%{$FG[219]%} R"
ZSH_THEME_GIT_PROMPT_BISECTING="%{$FG[219]%} B"
ZSH_THEME_GIT_PROMPT_CHERRYPICKING="%{$FG[219]%} C"

# For mercurial plugin
ZSH_THEME_HG_PROMPT_PREFIX="%{$FG[214]%}☿"
ZSH_THEME_HG_PROMPT_SUFFIX=""
ZSH_THEME_HG_PROMPT_DIRTY="*"
ZSH_THEME_HG_PROMPT_CLEAN=""

ZSH_SPECTRUM_TEXT="To iterate is human; to recurse, divine"

ZSH_THEME_REPO_NAME_COLOR="%{$FG[011]%}"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="gxagfxfacxbabagegchchd"
export LS_COLORS="di=36:ln=30;46:so=35:pi=35;40:ex=32:bd=31;40:cd=31;40:su=36;44:sg=36;42:tw=37;42:ow=37;43"

local status_indicator="%(?|%{$FG[010]%}%# |%{$FG[009]%}%# )"
PROMPT="%B%{$FG[045]%}%n %{$FG[011]%}%~$status_indicator%{$reset_color%}%B"
RPROMPT='$(git_prompt_info_jdk)$(hg_prompt_info_jdk)%{$reset_color%}'
