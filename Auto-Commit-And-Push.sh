#!/bin/bash

if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit."
  
    if [[ "$(git status -sb)" != *"ahead"* ]]; then
        echo "Everything is up to date"
        exit 0
    fi
else
    ls
    read -p "Please Enter Your Branch Name: " branch
    read -p "Do You Want To Send All Files y/n: " msg
    if [ "$msg"  == "Y" ] || [ "$msg" == "y" ]; then
       read -p "Enter Commit Name: " name
       git add . 
       git commit -m "$name"
    else
       read -p "Enter File Name: " file
       read -p "Enter Commit Name: " name2
       git add "$file"
       git commit -m "$name2"
    fi
fi

git push origin "$branch"
echo "Pushed to remote repository"
git status