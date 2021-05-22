#!/bin/bash
echo "Installing bbb-live-streming"
URL="$(bbb-conf --secret |grep "URL" | cut -d "/" -f3)"
SECRET="$(bbb-conf --secret |grep "Secret" |head -1| cut -d ":" -f2)"
echo "Generating .env"
cp -r sample-env .env
sed -i 's/BBB_URL=.*/$URL/g' .env
sed -i 's/BBB_SECRET=.*/$SECRET/g' .env
echo "Creating bbb-live-streaming:v1 Docker image"
docker build -t bbb-live-streaming:v1 .
echo "Cleaning up the folder"
mkdir src
cp *.js Dockerfile *.json sample-env start.sh stop.sh bbb-streaming-install.sh src 