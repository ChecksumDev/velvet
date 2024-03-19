#!/bin/bash

# repo name $1 ${{env.REPO_NAME}} 
# release please PAT $2 ${{ secrets.RELEASE_PLEASE_PAT }}
# github.repo = $3 ${{ github.repository }} 
# packwiz current version = $4 ${{env.packWizCurrVersion}}
# packwiz new version = $5 ${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }}
# github username = $6 ${{ env.commitUsername }}
# start script args: '${{env.REPO_NAME}}' '${{ secrets.RELEASE_PLEASE_PAT }}' '${{ github.repository }}' '${{env.packWizCurrVersion}}' '${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }}' '${{ env.commitUsername }}'

git config --global user.name '$6'
git config --global user.email '$6@users.noreply.github.com'
git config --global pull.rebase false  # merge
mkdir ../packwiz-fix
cd ../packwiz-fix
git clone https://github.com/$3
cd ../packwiz-fix/$1
git remote set-url origin https://x-access-token:$2@github.com/$3
git pull origin release-please--branches--main 
git branch release-please--branches--main
sed -i 's/$4/version = "$5"/g' pack.toml
git add pack.toml
git commit -m "Update Packwiz Version"