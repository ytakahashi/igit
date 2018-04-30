
_igit_branch(){

    if [ $# -lt 1 ]; then
        echo "'igit branch' requires option."
        return 1
    fi

    if [ $1 != "delete" ]; then
        echo "invalid option '$1'."
        return 1
    fi

    local branch remote
    
    branch=$(
        git branch |
        grep -v "\*" |
        cut -b 3- |
        _fzf_for_igit --preview 'git diff --color=always {-1}'
    )

    if [[ -z "$branch" ]]; then
        return 0
    fi

    print -z "git branch -D $branch"

}
