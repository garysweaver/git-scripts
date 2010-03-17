# gbranch.sh
#
# Written by Gary S. Weaver
#
# Release: 2010-03-17
# This tracks a remote branch if it already exists, or
# makes a remotely tracking git branch if one doesn't exist, or
# just switches to the local branch by that name.

function gbranch () {
  branch=$1
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
  else
    echo usage: gbranch \(jira_ticket\)
  fi
}
