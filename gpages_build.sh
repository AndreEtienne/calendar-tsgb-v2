#!/usr/bin/env bash
set -ve

#Define properties.
build_environment=stage
gh_pages_repo=
cname=""

#Get Name and Email for Git config.
NAME=$(git log --pretty=format:"%an"|head -n1)
EMAIL=$(git log --pretty=format:"%ae"|head -n1)


#Go in build and make git init then push this to gh-pages.
cd public
echo $cname > CNAME
git init
git remote add origin "https://${GH_TOKEN}@${GH_REF}"
git checkout --orphan gh-pages
git config user.name ${NAME}
git config user.email ${EMAIL}

git add -A .
git commit -am "Deploy to GitHub Pages from ${TRAVIS_COMMIT}"
git push --force -u "https://${GH_TOKEN}@${gh_pages_repo}" gh-pages
