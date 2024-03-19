#!/bin/bash

# repo name $1 ${{env.REPO_NAME}} 
# release please PAT $2 ${{ secrets.RELEASE_PLEASE_PAT }}
# github.repo = $3 ${{ github.repository }} 
# packwiz new version = $4 ${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }}
# github username = $5 ${{ env.commitUsername }}
# start script args: ${{env.REPO_NAME}} ${{ secrets.RELEASE_PLEASE_PAT }} ${{ github.repository }} ${{steps.release.outputs.major }}.${{steps.release.outputs.minor }}.${{steps.release.outputs.patch }} ${{ env.commitUsername }}
echo Configuring git
echo $(ls)
git config --global user.name '$5'
git config --global user.email '$5@users.noreply.github.com'
git config --global pull.rebase false  # merge
echo Making directory and going into
echo $(ls)
mkdir ../packwiz-fix
cd ../packwiz-fix
echo Cloning and going into
echo $(ls)
git clone https://github.com/$3
cd ../packwiz-fix/$1
echo More git config
echo $(ls)
git remote set-url origin https://x-access-token:$2@github.com/$3
git pull origin release-please--branches--main 
git branch release-please--branches--main
echo editing file
echo $(ls)
sed -i 's/$(head -n 3 pack.toml | tail -n 1)/version = "$4"/g' pack.toml
echo Adding file
echo $(ls)
git add pack.toml
echo Commiting file
echo $(ls)
git commit -m "Update Packwiz Version"