#!/bin/bashecho -e "\033[0;32mDeploying updates to GitHub...\033[0m"cd publicif [ -n "$GITHUB_AUTH_SECRET" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $GITHUB_AUTH_SECRET > ~/.git-credentials    git config credential.helper store
    git config user.email "glicameli+blog-bot@outlook.com"
    git config user.name "novabutter-blog-bot"
figit add .
git commit -m "Rebuild site"
git push --force origin HEAD:master
