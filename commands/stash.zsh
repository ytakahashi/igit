
_igit_stash() {

    if [ $# -lt 1 ]; then
        echo "'igit stash' requires option."
        return 1
    fi

    if [ $1 != "apply" -a $1 != "drop" ]; then
        echo "invalid option '$1'."
        return 1
    fi

    local stash cmd st

    while stash=$(
        git stash list |
        _fzf_for_igit --expect=ctrl-d +m --preview 'git diff --color=always {-1}'); do
        
        cmd=$(sed -n 1P <<< "$stash")
        st=$(sed -n 2P <<< "$stash")

        [[ -z "$stash" ]] && continue
        if [ "$cmd" = ctrl-d ]; then
            local name=$(awk -F ':' {'print $1'} <<< "$st")
            git diff --color=always $name | less -R
        else
            print -z "git stash $1 $name"
            break
        fi
    done

}
