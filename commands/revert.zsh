_igit_revert() {
    local selected=$(git log --graph --color=always \
        --pretty=format:'%C(auto) %d %C(yellow) "%s"%C(green) %cr %C(black) %H%C(reset)' |
        _fzf_for_igit +m \
        --header "select a commit to revert" \
        --preview 'if [[ {-1} =~ "[a-f0-9]+" ]]; then git show --color=always {-1}; fi')
    print -z "git revert $(awk '{print $NF}' <<< "$selected")"
}
