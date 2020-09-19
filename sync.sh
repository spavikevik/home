#!/bin/sh

rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .github/'    \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --filter='P LICENSE'     \
         --filter='P CNAME'       \
         --filter='P sync.sh'     \
         --delete-excluded        \
         _site/ .

git config user.name github-actions
git config user.email github-actions@github.com
git add .
git commit -m "sync at $(date)"
git push
