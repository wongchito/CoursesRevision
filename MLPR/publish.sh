#!/bin/bash

jupyter nbconvert --to=html_toc MLPR\ Revision.ipynb

rm -rf docs/
mkdir docs
mv MLPR\ Revision.html docs/index.html
mv MLPR\ Revision_files/ docs/