
_igit_add() {

    local files cmd adding
    while files=$(
        git -c color.status=always status -uall --short | 
        awk '!match($0, /  /)' | 
        _fzf_for_igit --multi --expect=ctrl-a --preview 'git diff --color=always -- {2}'); do

        if [[ -z "$files" ]]; then
            return 0
        fi

        cmd=$(sed -n 1P <<< "$files")
        adding=(`awk '{print $2}' <<< "$files"`)
        
        if [ "$cmd" = ctrl-a ]; then
            git add $adding
            printf "\n\e[36mAdded files:\e[0m\n"
            for f in $adding; do
                printf " \e[32m $f\e[0m\n"
            done
            break
        else
            git diff --color=always $adding | less -R
        fi
    done
    
}
