#! /bin/bash
MESSAGE=$1

echo Committing everying with message \"$MESSAGE\"

for dir in `ls -d */`; do
  pushd $dir > /dev/null;
  echo;
  if [[ -d .git ]]; then
    echo "Committing $dir";
    git add *;
    git status;
    git commit -m "$MESSAGE"
    git push;
  fi
  popd > /dev/null;
done
