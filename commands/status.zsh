
_igit_status() {

    local file=$(
        git -c color.status=always status -uall --short | 
        awk '{printf "[%s] ", $1; print $2}' | 
        _fzf_for_igit --preview 'git diff --color=always {-1}')

    [[ -n $file ]] && echo $file | git diff --color=always | less -R
}
