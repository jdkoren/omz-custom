reset_font="%f%k%b"

# For git plugin
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{214} ±("
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{214}) "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

ZSH_THEME_GIT_PROMPT_BISECTING="%B%F{219} B"
ZSH_THEME_GIT_PROMPT_CHERRYPICKING="%B%F{219} C"
ZSH_THEME_GIT_PROMPT_MERGING="%B%F{219} M"
ZSH_THEME_GIT_PROMPT_REBASING="%B%F{219} Rb"
ZSH_THEME_GIT_PROMPT_REVERTING="%B%F{219} Rv"

# For mercurial plugin
ZSH_THEME_HG_PROMPT_PREFIX="%B%F{214} ☿("
ZSH_THEME_HG_PROMPT_SUFFIX="%B%F{214}) "
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="*"

ZSH_SPECTRUM_TEXT="To iterate is human; to recurse, divine"

ZSH_THEME_REPO_NAME_COLOR="%F{011}"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="gxagfxfacxbabagegchchd"
export LS_COLORS="di=36:ln=30;46:so=35:pi=35;40:ex=32:bd=31;40:cd=31;40:su=36;44:sg=36;42:tw=37;42:ow=37;43"

if [[ $(uname) = 'Darwin' ]]
then
  status_char='⨳'
else
  status_char='⮞' #'❯'
fi
local status_indicator="%B%(?|%F{010}|%F{009})$status_char %{$reset_font%}"

PROMPT='%B%F{045}%n %F{011}%~ $(all_prompt_info_jdk)
$status_indicator%(!.#.$) ' # end space intentional
