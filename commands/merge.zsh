
_igit_merge(){

    local branch
    
    while branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit +m --expect=ctrl-d --preview 'git diff --color=always {}'); do

        if [[ -z "$branch" ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$branch")
        local merge=$(sed -n 2P <<< "$branch")

        if [ "$cmd" = ctrl-d ]; then
            git diff --color=always $merge | less -R
        else
        
            if  [[ $merge == remotes/* ]]; then
                local remote_branch remote_name branch_name

                remote_branch=${merge#remotes/}

                remote_name=${remote_branch%%/*}
                branch_name=${remote_branch#*/}

                print -z "git merge $remote_name/$branch_name"

            else
                print -z "git merge $merge"
            fi
            break
        fi

    done

}
