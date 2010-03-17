# http://github.com/garysweaver/git-scripts

# thanks to http://www.turnkeylinux.org/blog/generic-shell-hooks for the idea, which I modified to only call *.sh
for script in ~/git-scripts/autoload.d/*.sh; do
  # skip non-executable scripts
  [ -x "$script" ] || continue

  # execute $script in the context of the current shell
#  echo loading $script
  . $script
done
