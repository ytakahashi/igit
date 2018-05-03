
_igit_branch(){

    if [ $# -lt 1 ]; then
        echo "'igit branch' requires option."
        return 1
    fi

    if [ $1 != "delete" ]; then
        echo "invalid option '$1'."
        return 1
    fi

    local branch cmd br
    while branch=$(
        git branch |
        grep -v "\*" |
        cut -b 3- |
        _fzf_for_igit +m --expect=ctrl-d --preview 'git diff --color=always {}'); do

        if [[ -z "$branch" ]]; then
            return 0
        fi

        cmd=$(sed -n 1P <<< "$branch")
        br=$(sed -n 2P <<< "$branch")

        if [ "$cmd" = ctrl-d ]; then
            git diff --color=always $br | less -R
        else
            print -z "git branch -D $br"
            break
        fi

    done

}
