#!/bin/bashecho -e "\033[0;32mDeploying updates to GitHub...\033[0m"cd publicif [ -n "$GITHUB_TOKEN" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $GITHUB_TOKEN > ~/.git-credentials    git config credential.helper store
    git config user.email "novabutter-blog-bot@nusers.no.reploy.github.com"
    git config user.name "novabutter-blog-bot"
figit add .
git commit -m "Rebuild site"
git push --force origin HEAD:master
