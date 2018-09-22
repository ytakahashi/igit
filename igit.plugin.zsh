_igit_base_dir=$(cd $(dirname $0); pwd)
source ${_igit_base_dir}/commands/add.zsh
source ${_igit_base_dir}/commands/branch.zsh
source ${_igit_base_dir}/commands/cherry-pick.zsh
source ${_igit_base_dir}/commands/diff.zsh
source ${_igit_base_dir}/commands/log.zsh
source ${_igit_base_dir}/commands/stash.zsh
source ${_igit_base_dir}/commands/tag.zsh


igit() {
    
    git rev-parse --is-inside-work-tree > /dev/null
    if [ $? -gt 0 ]; then
        return 1
    fi

    if [ $# -lt 1 ]; then
        echo "Specify command. See 'igit help'"
        return 1
    fi

    case $1 in
        "add")
            [[ -z "$(git status -uall --short)" ]] && return 0
            _igit_add ;;
        "branch")
            _igit_branch ;;
        "cherry-pick")
            _igit_cherry_pick ;;
        "diff")
            [[ -z "$(git status -uall --short)" ]] && return 0
            _igit_diff ;;
        "log")
            _igit_log ;;
        "stash")
            _igit_stash ;;
        "tag")
            _igit_tag ;;
        "help")
            _igit_usage ;;
        *)
            echo "'$1' is not a valid option. See 'igit help'"
            return 1
    esac

}


_fzf_for_igit() {
    fzf --height 75% \
        --reverse \
        --border \
        --ansi \
        --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 \
        --color info:183,prompt:110,spinner:107,pointer:167,marker:215 \
        --preview-window down:70% \
        $@
}

_igit_usage () {

echo -e "\n\e[32mUsage:\e[m"
cat << EOF
    igit [command]
EOF
echo -e "\e[32mCommands:\e[m"
cat << EOF
    add
    branch
    cherry-pick
    diff
    log
    stash
    tag
    help
EOF

}

_igit() {
    _values \
        'commands' \
        'add' \
        'branch' \
        'cherry-pick' \
        'diff' \
        'log' \
        'stash' \
        'tag' \
        'help'
}

compdef _igit igit

_zle_add() {
    _igit_add
    zle reset-prompt
}

_zle_branch() {
    _igit_branch
    zle reset-prompt
}

_zle_log() {
    _igit_log
    zle reset-prompt
}

_zle_stash() {
    _igit_stash
    zle reset-prompt
}

zle -N _zle_add
zle -N _zle_branch
zle -N _zle_log 
zle -N _zle_stash

bindkey '^G^A' _zle_add
bindkey '^G^B' _zle_branch
bindkey '^G^L' _zle_log
bindkey '^G^S' _zle_stash
