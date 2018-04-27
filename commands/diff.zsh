
_fgit_diff() {

    local files q selected
    while files=$(
        git -c color.status=always status -uall --short | 
        awk '{printf "[%s] ", $1; $1="" ;print $2}' | 
        _fzf_for_fgit --multi --expect=ctrl-a --preview 'less {-1}'); do
        q=$(head -1 <<< "$files")
        selected=(`awk '{print $2}' <<< "$files"`)
        
        [[ -z "$selected" ]] && continue
        git diff --color=always $selected | less -R
    done
    
}
