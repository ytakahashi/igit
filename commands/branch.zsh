
_fgit_branch(){

    if [ $# -lt 1 ]; then
        echo "'fgit branch' requires option."
        return 1
    fi

    if [ $1 != "-d" -a $1 != "-D" ]; then
        echo "invalid option '$1'."
        return 1
    fi

    local branch remote
    
    branch=$(
        git branch |
        grep -v "\*" |
        cut -b 3- |
        _fzf_for_fgit --preview 'git diff --color=always {-1}'
    )

    if [[ -z "$branch" ]]; then
        return 0
    fi

    git branch $1 $branch

}
