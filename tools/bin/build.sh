#!/bin/sh

FOLDER=$(echo $(dirname $(readlink -f "$0")) | sed "s:/tools/bin::")

info() {
    echo "\n *** $1 ***\n"
}

dc () {
    if [ $(command -v docker-compose | wc -l) = "1" ]; then
        docker-compose \
            --project-directory $FOLDER \
            -f $FOLDER/docker-compose.yml \
            -p vefa-ehf-espd \
            run --rm $@
    else
        docker run --rm -i \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v $FOLDER:/src \
            docker/compose:1.18.0 \
            --project-directory $FOLDER -f /src/docker-compose.yml -p vefa-ehf-espd run --rm $@
    fi
}


info "Delete existing target folder"

dc target-rm


info "Run vefa-structure"

dc structure


info "Generate full Schematron for OpenPEPPOL"

dc schematron


info "Build and verify validation artifacts"

dc validator


info "Generate Asciidoctor documents"

dc asciidoctor


info "Fix ownership"

docker run --rm -i -v $FOLDER:/src alpine:3.6 chown -R $(id -g $USER).$(id -g $USER) /src/target
