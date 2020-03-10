#!/bin/bash

if [ $# -ne 5 ]
then
  echo "Usage: $0 <KUBE_CONFIG> <CLIENT_KEY_NAME> <NAMESPACE> <HELM_RELEASE> <SERVICE_IP>"
  exit
fi

KUBE_CONFIG=$1
KEY_NAME=$2
NAMESPACE=$3
HELM_RELEASE=$4
SERVICE_IP=$5

POD_NAME=$(kubectl --kubeconfig "$KUBE_CONFIG" get pods -n "$NAMESPACE" -l "app=openvpn,release=$HELM_RELEASE" -o jsonpath='{.items[0].metadata.name}')
kubectl --kubeconfig "$KUBE_CONFIG" -n "$NAMESPACE" exec -it "$POD_NAME" /etc/openvpn/setup/newClientCert.sh "$KEY_NAME" "$SERVICE_IP"
kubectl --kubeconfig "$KUBE_CONFIG" -n "$NAMESPACE" exec -it "$POD_NAME" cat "/etc/openvpn/certs/pki/$KEY_NAME.ovpn" > "$KEY_NAME.ovpn"