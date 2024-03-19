#!/bin/bash

# repo name $1 ${{env.REPO_NAME}} 
# release please PAT $2 ${{ secrets.RELEASE_PLEASE_PAT }}
# github.repo = $3 ${{ github.repository }} 
# packwiz new version = $4 ${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }}
# github username = $5 ${{ env.commitUsername }}
# start script args: ${{env.REPO_NAME}} ${{ secrets.RELEASE_PLEASE_PAT }} ${{ github.repository }} ${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }} ${{ env.commitUsername }}
git config --global user.name '$5'
git config --global user.email '$5@users.noreply.github.com'
git config --global pull.rebase false  # merge
mkdir ../packwiz-fix
cd ../packwiz-fix 
git clone https://github.com/$3 
cd ../packwiz-fix/$1 
git remote set-url origin https://x-access-token:$2@github.com/$3 
git pull origin release-please--branches--main
git branch release-please--branches--main
awk -v CurrVer="$(head -n 3 pack.toml | tail -n 1)" -v NewVer="version = \"$4\"" '{ sub(CurrVer, NewVer); print; }' pack.toml > newpack.toml 
cat newpack.toml > pack.toml 
rm newpack.toml
git add pack.toml
git commit -m "Update Packwiz Version" 