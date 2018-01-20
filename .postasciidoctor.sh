#!/bin/sh

if [ -e /target/site ]; then
    mv /target/guide /target/site/en
fi

find /target/site/en -name .adocassets -exec rm '{}' \;