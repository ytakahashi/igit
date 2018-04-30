
_igit_merge(){

    local branch
    
    branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit --preview 'git diff --color=always {-1}'
    )

    if [[ -z "$branch" ]]; then
        return 0
    fi

    if  [[ $branch == remotes/* ]]; then
        local remote_branch remote_name branch_name

        remote_branch=${branch#remotes/}

        remote_name=${remote_branch%%/*}
        branch_name=${remote_branch#*/}

        print -z "git merge $remote_name/$branch_name"

    else
        print -z "git merge $branch"
    fi

}
