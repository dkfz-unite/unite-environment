#!/bin/bash

src_pth=$(jq -r .SourceCodeDirectoryPath ../../config.json)

tput setaf 6; echo "# Installing UNITE analysis service (Methylation Arrays Principal Components Analysis)"; tput sgr0
echo ""

tput setaf 4; echo "# Cleaning up source code directory"; tput sgr0
rm -r -f src
echo ""

tput setaf 4; echo "# Cloning fresh code to source code directory"; tput sgr0
mkdir src
cp -r $src_pth/unite-analysis-pcam/. src/
echo ""

tput setaf 4; echo "# Building and running docker image"; tput sgr0

docker compose -p 'unite' -f docker-compose.build.yml up -d --build