#!/bin/bash
echo "Installing bbb-live-streming"

echo "Creating .env, Please edit it accordingly"
cp -r sample-env .env
echo "Creating bbb-live-streaming:v1 Docker image"
docker build -t bbb-live-streaming:v1 .
echo "Cleaning up the folder"
if [ -d src ];then
echo "src folder exist, skipping mkdir src"
else 
mkdir -p src
fi
mv -f *.js Dockerfile *.json sample-env start.sh stop.sh bbb-streaming-install.sh nsswrapper.sh docker-entrypoint.sh src 