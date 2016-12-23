#!/usr/bin/env bash

set -e

# Build the image.
docker build . -t serverless-qbasic

# Start the container.
CONTAINER_ID=$(docker run -d -p 8080:8080 serverless-qbasic)
echo $CONTAINER_ID

# Wait a little, give the container some time to come to life.
sleep 10

# Send a test payload.
RESULT=$(curl -s -X POST -H 'Content-Type: application/json' 'http://localhost:8080/run' -d '{ "value": { "input": "Hello world" } }')

echo $RESULT
echo ""

# Clean up.
docker stop ${CONTAINER_ID}
docker rm -f ${CONTAINER_ID}

# Return proper status code.
if [[ "$RESULT" == *".--"* ]]; then
    echo "Morse code found in answer. All good."
    exit 0
else
    echo "Unexpected answer?"
    exit 1
fi
