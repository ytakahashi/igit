_igit_switch(){

    local branch
    while branch=$(
        git branch -a -vv --color=always |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit --no-multi --expect=enter \
        --preview 'git show --color=always {1}'); do

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

            print -z "git switch -c $branch_name $remote_name/$branch_name"
            break
        else
            print -z "git switch $br"
            break
        fi
    done
}
