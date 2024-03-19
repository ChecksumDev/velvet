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
echo LS \| $(ls)
echo PWD \| $(pwd)
echo MKDIR \| $( )
mkdir ../packwiz-fix
echo CD \| $()
cd ../packwiz-fix 
echo Cloning and going into
echo LS \| $(ls)
echo PWD \| $(pwd)
echo CLONE \| $()
git clone https://github.com/$3 
echo CD \| $()
cd ../packwiz-fix/$1 
echo LS \| $(ls)
echo PWD \| $(pwd)
echo More git config
echo LS \| $(ls)
echo PWD \| $(pwd)
echo GIT REMOTE \| $()
git remote set-url origin https://x-access-token:$2@github.com/$3 
echo GIT PULL \| $( )
git pull origin release-please--branches--main
echo GIT BRANCH  \| $( )
git branch release-please--branches--main
echo editing file
echo LS  \| $(ls)
echo PWD  \| $(pwd)
echo CAT  \| $(cat pack.toml)
awk -v CurrVer="$(head -n 3 pack.toml | tail -n 1)" -v NewVer="$4" '{ sub(CurrVer, NewVer); print; }' pack.toml > newpack.toml 
cat newpack.toml > pack.toml 
rm newpack.toml
echo CAT \| $(cat pack.toml)
echo Adding file
echo LS  \| $(ls)
echo PWD \| $(pwd)
echo GIT ADD  \| $(git add pack.toml)
echo Commiting file
echo LS \| $(ls)
echo PWD  \| $(pwd)
echo GIT COMMIT  \| $(git commit -m "Update Packwiz Version" )