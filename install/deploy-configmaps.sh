#! /bin/bash
echo;
echo Deploying configMaps;

pushd config > /dev/null;
kubectl.exe create secret generic postgres-secrets --from-file=./password
kubectl.exe create secret generic db-client-secrets --from-file=./db_user --from-file=./db_password
kubectl.exe create secret generic jwt-key --from-file=./jwt-key
kubectl.exe create secret generic secure-key --from-file=./secure-key
kubectl.exe create configmap host-url --from-file=./host-url
kubectl.exe create configmap app-config --from-file=./env.js
popd > /dev/null;
