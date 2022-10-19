#!/usr/bin/env bash

function worker() {
    kubectl -n $NAMESPACE get pods | grep $POD_STATUS | awk '{print $1}' | xargs kubectl -n $NAMESPACE delete pods --force
    echo "Finished"
}

worker
echo $?