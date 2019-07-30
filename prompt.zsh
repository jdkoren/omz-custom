# Get the difference between the current branch and its remote tracking branch
git_remote_ahead_behind() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        git_state=""
        if [ ${ahead} -gt 0 ]
        then
            git_state="${git_state}  %{$FG[010]%}${ahead##*( )}↑"
        fi

        if [ ${behind} -gt 0 ]
        then
            git_state="${git_state}  %{$FG[009]%}${behind##*( )}↓"
        fi

        echo "${git_state}"
    fi
}

# Returns a theme environment value if Git is in the middle of one of these
# operations:
#     Bisecting      -> ZSH_THEME_GIT_PROMPT_BISECTING
#     Cherry-picking -> ZSH_THEME_GIT_PROMPT_CHERRYPICKING
#     Merging        -> ZSH_THEME_GIT_PROMPT_MERGING
#     Rebasing       -> ZSH_THEME_GIT_PROMPT_REBASING
#     Reverting      -> ZSH_THEME_GIT_PROMPT_REVERTING
git_conflict_state() {
    git_dir=$(command git rev-parse --git-dir 2>/dev/null)
    if [[ -e "${git_dir}/MERGE_HEAD" ]]
    then
        echo "$ZSH_THEME_GIT_PROMPT_MERGING"
    elif [[ -e "${git_dir}/REVERT_HEAD" ]]
    then
        echo "$ZSH_THEME_GIT_PROMPT_REVERTING"
    elif [[ -e "${git_dir}/rebase-merge" || -e "${git_dir}/rebase-apply" ]]
    then
        echo "$ZSH_THEME_GIT_PROMPT_REBASING"
    elif [[ -e "${git_dir}/CHERRY_PICK_HEAD" ]]
    then
        echo "$ZSH_THEME_GIT_PROMPT_CHERRYPICKING"
    elif [[ -e "${git_dir}/BISECT_LOG" ]]
    then
        echo "$ZSH_THEME_GIT_PROMPT_BISECTING"
    fi
}

# Report the current state of the Git repo
git_prompt_info_jdk() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return

    git_info="${ref#refs/heads/}"
    conflict_state=$(git_conflict_state)
    if [[ -n ${conflict_state} ]]
    then
        git_info="${git_info}${conflict_state}"
    else
        git_info="${git_info}$(parse_git_dirty)$(git_remote_ahead_behind)"
    fi

    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_REPO_NAME_COLOR${git_info}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Replacement for hg_get_branch_name
hg_get_rev_name() {
    if [ $(in_hg) ]
    then
        local names=($(hg id -T "{currentbookmark} {tags} {p1.node|short} {dirty}\n"))
        local rev="${names[1]}"
        local last="${names[$#names]}"
        if [[ "$last" = "+" ]]; then
            rev+="$ZSH_THEME_HG_PROMPT_DIRTY"
        fi
        echo "$rev"
    fi
}

# Report the current state of the Mercurial repo
hg_prompt_info_jdk() {
    if [ $(in_hg) ]
    then
        local _display=$(hg_get_rev_name)
        echo "$ZSH_THEME_HG_PROMPT_PREFIX$ZSH_THEME_REPO_NAME_COLOR$_display$ZSH_THEME_HG_PROMPT_SUFFIX"
    fi
}

all_prompt_info_jdk() {
    echo $(git_prompt_info_jdk)$(hg_prompt_info_jdk)
}
