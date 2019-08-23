_igit_merge(){

    local branch
    while branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit --no-multi --expect=enter \
        --preview 'git diff --color=always {}'); do

        if [[ -z $branch ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$branch")
        local br=(`awk 'NR>1{print $1}' <<< "$branch"`)

        if [[ -z $cmd ]]; then
            return 0
        fi

        if  [[ $br == remotes/* ]]; then
            local remote_branch=${br#remotes/}
            local remote_name=${remote_branch%%/*}
            local branch_name=${remote_branch#*/}

            print -z "git merge $remote_name/$branch_name"
            break
        else
            print -z "git merge $br"
            break
        fi
    done
}
