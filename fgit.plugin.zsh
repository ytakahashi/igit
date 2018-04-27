
FGIT_BASE_DIRECTORY=$(cd $(dirname $0); pwd)
source ${FGIT_BASE_DIRECTORY}/commands/add.zsh
source ${FGIT_BASE_DIRECTORY}/commands/branch.zsh
source ${FGIT_BASE_DIRECTORY}/commands/checkout.zsh
source ${FGIT_BASE_DIRECTORY}/commands/diff.zsh
source ${FGIT_BASE_DIRECTORY}/commands/status.zsh


fgit() {
    
    git rev-parse --is-inside-work-tree > /dev/null
    if [ $? -gt 0 ]; then
        return 1
    fi

    if [ $# -lt 1 ]; then
        echo "Specify command. See 'fgit help'"
        return 1
    fi

    case $1 in
        "add")
            _fgit_add ;;
        "branch")
            shift
            _fgit_branch $@ ;;
        "checkout")
            _fgit_checkout ;;
        "diff")
            _fgit_diff ;;
        "status")
            _fgit_status ;;
        "help")
            _fgit_usage ;;
        *)
            echo "'$1' is not a valid option. See 'fgit help'"
            return 1
    esac

}


_fzf_for_fgit() {
    fzf --height 75% \
        --reverse \
        --border \
        --ansi \
        --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 \
        --color info:183,prompt:110,spinner:107,pointer:167,marker:215 \
        $@
}


_fgit_usage () {
cat << EOF
Usage:
    fgit [command]

Commands:
    add
    branch [option]
    checkout
    diff
    status
    help

Options:
    branch
        -d: deletes selected branch if it has already been merged to another branch
        -D: deletes selected branch

EOF
}
