
_igit_diff() {

    local files
    while files=$(
        git -c color.status=always status -uall --short | 
        awk '!match($0, /  /)' | 
        _fzf_for_igit +m --expect=ctrl-s,enter \
        --header "ctrl-s: see diff, enter: see the file" \
        --preview 'git diff --color=always -- {2}'); do

        if [[ -z "$files" ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$files")
        local f=(`awk '{print $2}' <<< "$(sed -n 2P <<< "$files")"`)

        if [ $cmd = ctrl-s ]; then
            git diff --color=always -U99999 -- $f | less -R
        else
            less $f
        fi

    done
    
}
