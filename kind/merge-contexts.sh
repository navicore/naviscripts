#!/usr/bin/env bash

OLD_CONTEXT_NAME=$1
NEW_CONTEXT_NAME=$2

export KUBECONFIG="$OLD_CONTEXT_NAME:$NEW_CONTEXT_NAME" 

kubectl config view --merge --flatten
