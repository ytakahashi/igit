
_fgit_add() {

    local files q adding
    while files=$(
        git -c color.status=always status -uall --short | 
        awk '{printf "[%s] ", $1; $1="" ;print $2}' | 
        _fzf_for_fgit --multi --expect=ctrl-a --preview 'less {-1}'); do
        q=$(head -1 <<< "$files")
        adding=(`awk '{print $2}' <<< "$files"`)
        
        [[ -z "$adding" ]] && continue
        if [ "$q" = ctrl-a ]; then
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
