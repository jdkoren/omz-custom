# get the difference between the local and remote branches
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

# If a merge, rebase, or bisect is in progress, returns $ZSH_THEME_GIT_PROMPT_MERGING,
# $ZSH_THEME_GIT_PROMPT_REBASING, or $ZSH_THEME_GIT_PROMPT_BISECTING respectively.
git_merge_state() {
	git_dir=$(command git rev-parse --git-dir 2>/dev/null)
	if [[ -e "${git_dir}/MERGE_HEAD" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_MERGING"
	elif [[ -e "${git_dir}/rebase-merge" || -e "${git_dir}/rebase-apply" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_REBASING"
	elif [[ -e "${git_dir}/BISECT_LOG" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_BISECTING"
	fi
}

function parse_git_state() {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return

	git_info="%{$FG[011]%}${ref#refs/heads/}"
	merge_state=$(git_merge_state)
	if [[ -n ${merge_state} ]]
	then
		git_info="${git_info}${merge_state}"
	else
		git_info="${git_info}$(parse_git_dirty)$(git_remote_ahead_behind)"
	fi

	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${git_info}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}