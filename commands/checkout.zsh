
_fgit_checkout(){

    local branch remote
    
    branch=$(
        git branch -a |
        grep -v "\*" |
        cut -b 3- |
        _fzf_for_fgit --preview 'git diff --color=always {-1}'
    )

    if [[ -z "$branch" ]]; then
        return 0
    fi

    if  [[ $branch == remotes/* ]]; then
        local remote_branch remote_name branch_name

        remote_branch=${branch#remotes/}

        remote_name=${remote_branch%%/*}
        branch_name=${remote_branch#*/}

        git checkout -b $branch_name $remote_name/$branch_name

    else
        git checkout $branch
    fi

}
