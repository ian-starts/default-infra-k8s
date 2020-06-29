#!/bin/bash

if [ $# -ne 4 ]
then
  echo "Usage: $0 <KUBE_CONFIG> <CLIENT_KEY_NAME> <NAMESPACE> <HELM_RELEASE>"
  exit
fi

KUBE_CONFIG=$1
KEY_NAME=$2
NAMESPACE=$3
HELM_RELEASE=$4
POD_NAME=$(kubectl --kubeconfig "$KUBE_CONFIG" get pods -n "$NAMESPACE" -l "app=openvpn,release=$HELM_RELEASE" -o jsonpath='{.items[0].metadata.name}')
kubectl --kubeconfig "$KUBE_CONFIG" -n "$NAMESPACE" exec -it "$POD_NAME" /etc/openvpn/setup/revokeClientCert.sh $KEY_NAME