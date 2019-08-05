#~/bin/bash

for dir in `ls -d */`; do 
  pushd $dir > /dev/null; 
  echo;
  echo "Checking $dir";
  if [[ -d .git ]]; then
    git status; 
  fi
  popd > /dev/null; 
done
