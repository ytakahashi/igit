_igit_tag(){
    local tag
    while tag=$(
        git tag |
        _fzf_for_igit -m --expect=alt-c,ctrl-s,alt-c,alt-p,alt-s \
        --header "ctrl-s: show the tag, alt-c show diff between the tags, alt-p: push the tag to origin, alt-s: switch" \
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
            local diff=(`awk 'NR==2{printf $1};NR==3{printf "...%s",$1}' <<< "$tag"`)
            echo "git log $diff --pretty=format:'- %s (%h)'"
            git log $diff --pretty=format:'- %s (%h)'
            break
        elif [ $cmd = alt-p ]; then
            print -z "git push origin $t"
            break
        elif [ $cmd = alt-s ]; then
            print -z "git switch --detach refs/tags/$t"
            break
        fi
    done
}
