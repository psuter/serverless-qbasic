# Serverless QBasic

This repository contains all code required to run a QBasic program as an [OpenWhisk](https://github.com/openwhisk/openwhisk) action.

## Building and deploying

1. Build the Docker image.
2. Publish it to DockerHub, e.g. as `yourid/morse`.
3. Create an OpenWhisk action: `wsk action create morse --docker "yourid/morse"`.
4. Run it: `wsk action invoke -br morse -p input "les sanglots longs des violons de l'automne"`.

[![Build Status](https://travis-ci.org/psuter/serverless-qbasic.svg?branch=master)](https://travis-ci.org/psuter/serverless-qbasic)
