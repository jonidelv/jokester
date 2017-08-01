#!/usr/bin/env bash

npm run build;
cd dist;
mkdir dist;
cp -a ./build.js ./dist/;
cp -a ./build.js.map ./dist/;
rm build.js;
rm build.js.map;
mkdir static;
cd ..;
cp -a ./static/. ./dist/static;
cp -a ./index.html ./dist/;
cp -a ./index.css ./dist/;
git commit -am "Save local changes";
git checkout -B gh-pages;
git add -f dist;
git commit -am "Rebuild website";
git filter-branch -f --prune-empty --subdirectory-filter dist;
git push -f origin gh-pages
git checkout -;
