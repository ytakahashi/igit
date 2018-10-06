
_igit_branch(){

    local branch
    while branch=$(
        git branch -a |
        egrep -v "\*|origin/HEAD" |
        cut -b 3- |
        _fzf_for_igit -m --expect=ctrl-s,alt-c,alt-d,alt-m \
        --header "ctrl-s: see diff, alt-c: checkout, alt-d: delete branch, alt-m: merge" \
        --preview 'git diff --color=always {}'); do

        if [[ -z $branch ]]; then
            return 0
        fi

        local cmd=$(sed -n 1P <<< "$branch")
        local br=(`awk 'NR>1{print $1}' <<< "$branch"`)

        if [[ -z $cmd ]]; then
            return 0
        fi

        local branches=(`echo $br`)
        if [ $cmd != alt-d -a ${#branches[@]} -gt 1 ] ; then
            echo "multiple branches can only be selected when input command is delete (alt-d)"
            return 1
        fi

        if [ $cmd = ctrl-s ]; then
            git diff --color=always $br | less -R

        elif [ $cmd = alt-c -o $cmd = alt-m -o $cmd = alt-d ]; then

            if  [[ $br == remotes/* ]]; then
                local remote_branch=${br#remotes/}

                local remote_name=${remote_branch%%/*}
                local branch_name=${remote_branch#*/}

                if [ $cmd = alt-c ]; then
                    print -z "git checkout -b $branch_name $remote_name/$branch_name"
                elif [ $cmd = alt-d ]; then
                    if [ $branch_name = "master" -o $branch_name = "develop" ]; then
                        echo "Branch $remote_name/$branch_name cannot be deleted."
                        return 1
                    fi
                    print -z "git push --delete $remote_name $branch_name"
                else
                    print -z "git merge $remote_name/$branch_name"
                fi
                break

            else
                if [ $cmd = alt-c ]; then
                    print -z "git checkout $br"
                elif [ $cmd = alt-d ]; then
                    print -z "git branch -D $br"
                else
                    print -z "git merge $br"
                fi
                break
            fi

        else
            break
        fi

    done

}
  