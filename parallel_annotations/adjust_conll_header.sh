#!/usr/bin/env sh

# Adjust document title in CoNLL files, so that reference-coreference-scorer can compare them
sed -i '1s/-.*_/_/g' ./conll/*.conll
