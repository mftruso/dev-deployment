#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  POD=`kubectl get pods | grep postgres | cut -d' ' -f1`
  kubectl port-forward $POD 5432 &
else
  POD=`kubectl.exe get pods | grep postgres | cut -d' ' -f1`
  kubectl.exe port-forward $POD 5432 &
fi


PID=$!

psql -h localhost -U postgres \
  -c "create database servantscode" \
  -c "CREATE USER servant1 WITH LOGIN PASSWORD 'servant!IsH3r3'" \
  -c "GRANT ALL ON DATABASE servantscode TO servant1"

kill $PID


if [[ "$OSTYPE" == "darwin"* ]]; then
  kubectl exec -it $POD -- perl -pi -e "s/max_connections = 100/max_connections = 500/" /var/lib/postgresql/pgdata/postgresql.conf
  kubectl delete pod $POD
else
  kubectl.exe exec -it $POD -- perl -pi -e "s/max_connections = 100/max_connections = 500/" /var/lib/postgresql/pgdata/postgresql.conf
  kubectl.exe delete pod $POD
fi
