#!/usr/bin/env bash
set -e

# Build
mdbook build
rm -rf out/.git

# 3. Deploy
rm -rf deploy
mkdir deploy
cd deploy
git init
cp -r ../out/./ .
git add -A
git commit -m "Update `date`"
git push https://github.com/Seasawher/theorem_proving_in_lean4_ja.git +HEAD:gh-pages
cd ..
rm -rf deploy
