#!/bin/sh

if [ -e /target/site ]; then
    mv /target/guide /target/site/bis
fi

find /target/site/en -name .adocassets -exec rm '{}' \;