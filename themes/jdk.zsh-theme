ZSH_THEME_GIT_PROMPT_PREFIX="±"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

JDK_GIT_PROMPT_SUFFIX_MERGING="%{$FG[197]%} M"
JDK_GIT_PROMPT_SUFFIX_REBASING="%{$FG[197]%} R"
JDK_GIT_PROMPT_SUFFIX_BISECTING="%{$FG[197]%} B"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="hahdcxdafxgagafafahaha"
export LS_COLORS="di=37;40:ln=37;43:so=32;40:pi=33;40:ex=35;40:bd=36;40:cd=36;40:su=35;40:sg=35;40:tw=37;40:ow=37;40:"

PROMPT="%{$fg_bold[red]%}jdkoren %{$fg[yellow]%}%~ : %{$reset_color%}"
RPROMPT='%{$fg[yellow]%}%p $(git_prompt_info_extra)%{$reset_color%}'
