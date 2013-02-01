git-scripts
===========

Some scripts to use with Git that I use that might be handy for others. Please understand what they do before using them and use them at your own risk.

([original post about gbranch.sh][pst])

### Setup

    cd ~
    git clone http://github.com/garysweaver/git-scripts.git

Then add the following to your .bash_profile, or whatever you want:

    if [ -f ~/git-scripts/git-scripts.sh ]; then
      source ~/git-scripts/git-scripts.sh
    fi

Restart Terminal.app or whatever, and then test by doing:

    gbranch

### Usage

Read each script and understand what it does.

#### gbranch

The following tracks a remote branch if it already exists, or makes a remotely tracking git branch if one doesn't exist, or just switches to the local branch by that name:

    gbranch (branch_name)

The following tracks a remote branch if it already exists, or branches from the specified remote branch to make a remotely tracking git branch from it if the (new) branch_name doesn't exist, or just switches to the local (new) branch_name by that name:

    gbranch (some_branch_name) (existing_remote_branch_to_branch_from)

#### gdelete

The following removes either local, remote, or both local and remote branches with the specified name:

    gdelete (branch_name)

It used to be a quiet delete of both, but that may result in an accidentally deletion. It now prompts whether you want to delete local, remote, or both, and if you respond with something other than that, it won't delete.

#### Aliases

gpull and gpush make it easier to push/pull to the current branch, provided by Cody Caughlan in reply to [this stackoverflow thread][stov]:

    gpull
    gpush    

gmf is just an alias to generate a merge commit even if the merge resolved as a fast-forward (someone on our team came up with this alias, and even though it isn't clear, it is short and I remember it):

    gmf (branch_name_to_merge_into_current_branch)

### Updating

If you get the latest, be sure to either `source ~/git-scripts/git-scripts.sh` or close/reopen all terminal sessions.

### License

Copyright (c) 2010 Gary S. Weaver, released under the [MIT license][lic].


[lic]: http://github.com/garysweaver/git-scripts/blob/master/LICENSE
[pst]: http://stufftohelpyouout.blogspot.com/2010/03/git-branching-with-remote-tracking-made.html
[stov]: http://stackoverflow.com/questions/948354/git-push-current-branch
