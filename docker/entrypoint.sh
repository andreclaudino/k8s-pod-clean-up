#!/usr/bin/env bash

kubectl -n $NAMESPACE get pods | grep $POD_STATUS | awk '{print $1}' | xargs kubectl -n $NAMESPACE delete pods --force
