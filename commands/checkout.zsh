
_igit_checkout(){

    local branch cmd co
    while branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit +m --expect=ctrl-d --preview 'git diff --color=always {}'); do

        if [[ -z "$branch" ]]; then
            return 0
        fi

        cmd=$(sed -n 1P <<< "$branch")
        co=$(sed -n 2P <<< "$branch")

        if [ "$cmd" = ctrl-d ]; then
            git diff --color=always $co | less -R
        else
            if  [[ $co == remotes/* ]]; then
                local remote_branch remote_name branch_name

                remote_branch=${co#remotes/}

                remote_name=${remote_branch%%/*}
                branch_name=${remote_branch#*/}

                print -z "git checkout -b $branch_name $remote_name/$branch_name"

            else
                print -z "git checkout $co"
            fi
            break
        fi

    done

}
