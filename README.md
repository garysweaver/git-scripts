git-scripts
===========

Some scripts to use with Git that I use that might be handy for others. Please understand what they do before using them and use them at your own risk.

More info and attributions in the [original post][pst].

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

Example:

    gbranch (some_branch_name)

Read each script and understand what it does.

### License

Copyright (c) 2010 Gary S. Weaver, released under the [MIT license][lic].


[lic]: http://github.com/garysweaver/git-scripts/blob/master/LICENSE
[pst]: http://stufftohelpyouout.blogspot.com/2010/03/git-branching-with-remote-tracking-made.html
