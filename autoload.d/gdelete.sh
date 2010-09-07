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
    rbrch=`git branch -r`
    if [ "$?" -eq "0" ]
    then
      if [[ "$rbrch" =~ "origin/$branch" ]]
      then
        git push origin ":$branch"
      fi
      git branch -d "$branch"
    fi
  else
    echo "usage: gdelete (branch_name)"
  fi
}
