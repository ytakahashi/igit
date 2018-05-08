
_igit_add() {

    local files
    while files=$(
        git -c color.status=always status -uall --short | 
        awk '!match($0, /  /)' | 
        _fzf_for_igit --multi --expect=alt-a,ctrl-s \
        --header "ctrl-s: see diff, alt-a: add selected files" \
        --preview 'git diff --color=always -- {2}'); do

        if [[ -z $files ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$files")
        local adding=(`awk '{print $2}' <<< "$files"`)

        if [[ -z $cmd ]]; then
            return 0
        fi
        
        if [ $cmd = ctrl-s ]; then
            git diff --color=always $adding | less -R
        elif [ $cmd = alt-a ]; then
            print -z "git add $adding"
            break
        else
            break
        fi
    done
    
}
