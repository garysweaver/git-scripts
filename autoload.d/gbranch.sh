# gbranch.sh
#
# Written by Gary S. Weaver
#
# Release: 2010-11-24
# gbranch (branch_name) without [optional_remote_branch_to_branch_from]
# would sometimes unintentionally branch from the current branch. To
# fix, a call to gbranch (branch_name) is now the same as:
# gbranch (branch_name) master
#
# Release: 2010-06-28
# added gbranch (branch_name) [optional_remote_branch_to_branch_from]
# which tracks a remote branch if it already exists, or branches from
# the specified remote branch to make a remotely tracking git branch
# from it if the (new) branch_name doesn't exist, or just switches to
# the local (new) branch_name by that name.
#
# Release: 2010-03-17
# gbranch (branch_name) tracks a remote branch if it already exists, or
# makes a remotely tracking git branch if one doesn't exist, or
# just switches to the local branch by that name.

function gbranch () {
  branch=$1
  branchfrom=$2
  if test $# -eq 1
  then
    branchfrom="master"
  fi

  if test $# -gt 0 && test $# -lt 3
  then
    rbrch=`git branch -r`
    if [ "$?" -eq "0" ]
    then
      if [[ "$rbrch" =~ "origin/$branchfrom" ]] 
      then
        if [[ "$rbrch" =~ "origin/$branch" ]]
        then
          # if the branch to create has already been created, it just checks it out
          git checkout -b "$branch" --track "origin/$branch"
          if [ "$?" -ne "0" ]
          then
            git checkout "$branch"
          fi
        else
          git co --no-track -b "$branch" "origin/$branchfrom"
          git push origin "$branch"
          # this only works in git 1.7.0 and above
          git branch --set-upstream "$branch" "origin/$branch"
          if [ "$?" -ne "0" ]
          then
            echo "It looks like either you aren't using git 1.7.0 or above, or something went wrong."
            echo "To add tracking of the new branch to the corresponding remote branch, edit .git/config"
            echo "and add the following:"
            echo
            echo "[branch \"$branch\"]"
            echo "        remote = origin"
            echo "        merge = refs/heads/$branch"
          fi
        fi
      else
        echo "'origin/$branchfrom' did not exist remotely, so did not attempt to branch from it."
        echo
        echo "usage: gbranch (branch_name) [optional_remote_branch_name_to_branch_from_if_not_master]"
      fi
    fi
  else
    echo "usage: gbranch (branch_name) [optional_remote_branch_name_to_branch_from_if_not_master]"
  fi
}
