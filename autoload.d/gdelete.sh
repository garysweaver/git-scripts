# gdelete.sh
#
# Written by Gary S. Weaver
#
# Release: 2010-09-07
# gdelete (branch_name) removes a remote branch if it already exists, and
# removes the local branch with same name.

function gdelete () {
  branch=$1
  if test $# -eq 1
  then
    echo "Delete in local, remote, or both?"
    read answer
    rbrch=`git branch -r`
    if [ "$?" -eq "0" ]
    then
      if [[ "$rbrch" =~ "origin/$branch" ]]
      then
        if [[ "$answer" == "both" || "$answer" == "remote" ]]; then
          echo "Deleting remote branch: $branch"
          git push origin ":$branch"
        fi
      fi

      if [[ "$answer" == "both" || "$answer" == "local" ]]; then
        echo "Deleting local branch: $branch"
        git branch -d "$branch"
      fi
    fi
  else
    echo "usage: gdelete (branch_name)"
  fi
}
