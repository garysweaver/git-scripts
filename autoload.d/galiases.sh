# galiases.sh
#
# Written by Gary S. Weaver
#
# Release: 2010-06-28
#
# Aliases and related functions.
#
# gpull and gpush make it easier to push/pull to the current branch, provided by Cody Caughlan in
# http://stackoverflow.com/questions/948354/git-push-current-branch
# 
# gmf is just an alias to generate a merge commit even if the merge resolved as a fast-forward.

# http://stackoverflow.com/questions/948354/git-push-current-branch                                                                                                                                                                                                                 
function get_git_branch() {
  echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

alias gpull='git pull origin `get_git_branch`'
alias gpush='git push origin `get_git_branch`'
alias gmf='git merge --no-ff'
