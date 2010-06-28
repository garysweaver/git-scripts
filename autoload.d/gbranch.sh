# gbranch.sh
#
# Written by Gary S. Weaver
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
  optionalbranchfrom=$2
  if test $# -eq 1
  then
    rbrch=`git branch -r`
    if [ "$?" -eq "0" ]
    then
      if [[ "$rbrch" =~ "origin/$branch" ]]
      then
        git checkout -b "$branch" --track "origin/$branch"
        if [ "$?" -ne "0" ]
        then
          git checkout "$branch"
        fi
      else
        git checkout -b "$branch"
        if [ "$?" -eq "0" ]
        then
          # The following lines track the remote branch per: http://djwonk.com/blog/2009/04/18/tracking-remote-git-branches/
          # note: first two lines help avoid  "fatal: Cannot force update the current branch." error per DJWonk.
          git push origin "$branch"
          git checkout master
          git branch -f "$branch" "origin/$branch"
          git checkout "$branch"
        else
          git checkout "$branch"
        fi
      fi
    fi
  elif test $# -eq 2
  then
    rbrch=`git branch -r`
    if [ "$?" -eq "0" ]
    then
      if [[ "$rbrch" =~ "origin/$optionalbranchfrom" ]] 
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
          git co --no-track -b "$branch" "origin/$optionalbranchfrom"
          git push origin "$branch"
          # this only works in git 1.7.0 and above
          git branch --set-upstream "$branch" "origin/$branch"
          if [ "$?" -ne "0" ]
          then
            echo "It looks like either you aren't using git 1.7.0 or above, or something went wrong."
            echo "To add tracking of the new branch to the specified remote branch, edit .git/config"
            echo "and add the following:"
            echo
            echo "[branch \"$branch\"]"
            echo "        remote = origin"
            echo "        merge = refs/heads/$branch"
          fi
        fi
      else
        echo "'origin/$optionalbranchfrom' did not exist remotely, so did not attempt to branch from it."
        echo
        echo "usage: gbranch (branch_name) [optional_remote_branch_name_to_branch_from_if_not_master]"
      fi
    fi
  else
    echo "usage: gbranch (branch_name) [optional_remote_branch_name_to_branch_from_if_not_master]"
  fi
}
