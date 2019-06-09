
_igit_log() {

    local commit

    while commit=$(git log --graph --color=always \
        --pretty=format:'%C(auto) %d %C(yellow) "%s"%C(green) %cr %C(black) - %h%C(reset)' |
        _fzf_for_igit +m --expect=ctrl-s,alt-h,alt-s \
        --header "ctrl-s: see the commit, alt-h: reset hard to the commit, alt-s: reset soft to the commit" \
        --preview 'if [[ {-1} =~ "[a-f0-9]+" ]]; then git show --color=always {-1}; fi'); do

        if [[ -z $commit ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$commit")
        local l=$(sed -n 2P <<< "$commit")
        local hash=$(awk '{print $NF}' <<< "$l")

        if [[ -z $cmd ]]; then
            return 0
        fi

        if [ ${#hash} -ge 7 ]; then
            if [ $cmd = ctrl-s ]; then
                git show --color=always --pretty=fuller $hash | less -R
            elif [ "$cmd" = alt-h ]; then
                print -z "git reset --hard $hash"
                break
            elif [ "$cmd" = alt-s ]; then
                print -z "git reset --soft $hash"
                break
            else
                break
            fi
        fi
    done
}
