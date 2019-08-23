_igit_delete(){

    local branch
    while branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit --multi --expect=enter \
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
            echo "igit delete command does not delete remote branch(es)."
            break
        else
            print -z "git branch -D $br"
            break
        fi
    done
}
