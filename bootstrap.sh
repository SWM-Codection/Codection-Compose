#! /bin/bash 

## Check .env exists
if [ -f .env ]; then
    echo ".env file exists."
else
    echo ".env file does not exist. This script will automatically make .env from .env.sample"
    cp .env.sample .env
fi

## Update submodules
git pull origin main 
git submodule update --init --recursive 
git submodule update --remote 
git submodule foreach git pull origin main

## build dockerfiles 
cd ./Codection-Service-Discovery && ./gradlew dockerCreateDockerfile && cd ..

echo ""
echo ""
echo "All done!!! You can now run 'docker compose up'"


