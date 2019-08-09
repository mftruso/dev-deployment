#! /bin/bash

pushd install > /dev/null;
./deploy-configmaps.sh
./deploy-ingress.sh
popd > /dev/null;

pushd .. > /dev/null;
echo;
echo Starting elk stack;
pushd docker-elk > /dev/null;
make run;
popd > /dev/null;

echo;
echo Starting services;
./start_all.sh

popd > /dev/null;
