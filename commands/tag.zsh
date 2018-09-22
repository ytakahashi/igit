_igit_tag(){

    local tag
    while tag=$(
        git tag |
        _fzf_for_igit +m --expect=ctrl-s,alt-c \
        --header "ctrl-s: show the tag, alt-c: checkout" \
        --preview 'git show --color=always {}'); do

        if [[ -z $tag ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$tag")
        local t=$(sed -n 2P <<< "$tag")

        if [[ -z $cmd ]]; then
            return 0
        fi

        if [ $cmd = ctrl-s ]; then
            git show --color=always $t | less -R
        elif [ $cmd = alt-c ]; then
            print -z "git checkout refs/tags/$t"
            break
        fi

    done

}
  