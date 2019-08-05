#!/bin/bash
. ./all.sh

if [[ -f parish-manager.yaml ]]; then
  rm parish-manager.yaml
fi
if [[ -f sc-infrasctructure.yaml ]]; then
  rm sc-infrastructure.yaml
fi

cat docker-elk/elasticsearch/kube.yml >> sc-infrastructure.yaml
echo "---" >> sc-infrastructure.yaml
cat docker-elk/kibana/kube.yml >> sc-infrastructure.yaml
echo "---" >> sc-infrastructure.yaml
cat docker-elk/logstash/kube.yml >> sc-infrastructure.yaml

cat person-svc/postgres-kube.yml >> parish-manager.yaml
echo "---" >> parish-manager.yaml
for dir in $PROJECTS; do
  if [[ -f $dir/kube.yml ]]; then
    cat $dir/kube.yml >> parish-manager.yaml
    echo "---" >> parish-manager.yaml
  fi
done
perl -i -ne'print unless /imagePullPolicy/;' parish-manager.yaml
perl -i -ne'print unless /imagePullPolicy/;' sc-infrastructure.yaml
