#!/bin/bash

src_pth=$(jq -r .SourceCodeDirectoryPath ../../config.json)
api_key=$(jq -r .api.key ../../secrets.json)

tput setaf 6; echo "# Installing UNITE Web application"; tput sgr0
echo ""

tput setaf 4; echo "# Cleaning up source code directory"; tput sgr0
rm -r -f src
echo ""

tput setaf 4; echo "# Cloning fresh code to source code directory"; tput sgr0
mkdir src
cp -r $src_pth/unite/. src/
echo ""

tput setaf 4; echo "# Building and running docker image"; tput sgr0
API_KEY=$api_key \
docker compose -p 'unite' -f docker-compose.build.yml up -d --build