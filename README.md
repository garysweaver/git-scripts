git-scripts
===========

Some scripts to use with Git that I use that might be handy for others.

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

See each script to see what it does.

### License

Copyright (c) 2010 Gary S. Weaver, released under the [MIT license][lic].


[lic]: http://github.com/garysweaver/git-scripts/blob/master/LICENSE
