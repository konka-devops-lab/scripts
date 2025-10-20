#!/bin/bash

install_or_upgrade() {
    RELEASE_NAME=$1
    CHART_PATH=$2
    VALUES_FILE=$3

    if helm list -n "$NAMESPACE" | grep -q "^$RELEASE_NAME"; then
        echo "Upgrading $RELEASE_NAME..."
        helm upgrade "$RELEASE_NAME" "$CHART_PATH" -f "$VALUES_FILE"
    else
        echo "Installing $RELEASE_NAME..."
        helm install "$RELEASE_NAME" "$CHART_PATH" -f "$VALUES_FILE"
    fi
}

NAMESPACE="instana"

install_or_upgrade "mongo" "." "dev/mongo.yaml" 
sleep 10
install_or_upgrade "mysql" "." "dev/mysql.yaml"
sleep 10
install_or_upgrade "rabbitmq" "." "dev/rabbitmq.yaml"
sleep 10
install_or_upgrade "redis" "." "dev/redis.yaml"

    