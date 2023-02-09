#!/bin/bash

echo "Adding git aliases..."

# common aliases
git config --global alias.st "status -sb"
git config --global alias.br "branch"
git config --global alias.ci "commit"
git config --global alias.co "checkout"
git config --global alias.di "diff"
git config --global alias.uncommit "reset HEAD~1"
git config --global alias.last-change "diff HEAD^"

# not so common aliases
git config --global alias.ch    "diff --cached"
git config --global alias.put   "push origin HEAD"
git config --global alias.track "checkout --track"
git config --global alias.fe    "fetch origin"
git config --global alias.ap    "apply"

# miscellaneous aliases
git config --global alias.opts "config --list"
git config --global alias.logg "log --pretty=oneline --graph --abbrev-commit"
git config --global alias.log2 "log --pretty=format:'%an :: %s' --graph"

# stashing aliases
git config --global alias.spit "stash show -p"
git config --global alias.list "stash list"
git config --global alias.save "stash save"
git config --global alias.drop "stash drop"
git config --global alias.pop  "stash pop"
git config --global alias.sap  "stash apply"
git config --global alias.stash-unapply '!git stash show -p | git apply -R'
git config --global alias.overwrite-with-remote '!f(){ ACTUAL_BRANCH=`git rev-parse --abbrev-ref HEAD`; git fe; git reset --hard origin/$ACTUAL_BRANCH;}; f'

# hardcore-stashing aliases
git config --global alias.spit0 "stash show -p stash@{0}"
git config --global alias.spit1 "stash show -p stash@{1}"
git config --global alias.spit2 "stash show -p stash@{2}"
git config --global alias.spit3 "stash show -p stash@{3}"
git config --global alias.spit4 "stash show -p stash@{4}"
git config --global alias.spit5 "stash show -p stash@{5}"
git config --global alias.spit6 "stash show -p stash@{6}"

git config --global alias.drop0 "stash drop stash@{0}"
git config --global alias.drop1 "stash drop stash@{1}"
git config --global alias.drop2 "stash drop stash@{2}"
git config --global alias.drop3 "stash drop stash@{3}"
git config --global alias.drop4 "stash drop stash@{4}"
git config --global alias.drop5 "stash drop stash@{5}"
git config --global alias.drop6 "stash drop stash@{6}"

echo "Added git aliases"