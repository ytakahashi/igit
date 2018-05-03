
_igit_diff() {

    local file 
    while file=$(
        git -c color.status=always status -uall --short | 
        awk '!match($0, /  /)' | 
        _fzf_for_igit --preview 'git diff --color=always -- {2}'); do

        if [[ -z "$file" ]]; then
            return 0
        fi

        local f=(`awk '{print $2}' <<< "$file"`)
        git diff --color=always -U99999 -- $f | less -R
    done
    
}
