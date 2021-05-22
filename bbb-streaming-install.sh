#!/bin/bash
echo "Installing bbb-live-streming"
URL="$(bbb-conf --secret |grep "URL" | awk '{print $2}')"
SECRET="$(bbb-conf --secret |grep "Secret"  | head -1| awk '{print $2}' )"
echo "Generating .env"
cp -r sample-env .env
sed -i 's/BBB_URL=.*/BBB_URL=$URL/g' .env
sed -i 's/BBB_SECRET=.*/BBB_SECRET=$SECRET/g' .env
echo "Creating bbb-live-streaming:v1 Docker image"
docker build -t bbb-live-streaming:v1 .
echo "Cleaning up the folder"
if [ -d src ];then
echo "src folder exist, skipping mkdir src"
else 
mkdir -p src
fi
cp *.js Dockerfile *.json sample-env start.sh stop.sh bbb-streaming-install.sh nsswrapper.sh docker-entrypoint.sh src 