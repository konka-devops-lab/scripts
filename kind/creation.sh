#!/bin/bash

kind create cluster --config dev-cluster.yaml --name dev
kind create cluster --config prod-cluster.yaml --name prod


# How multiple cluster works with kubeconfig
# How clusters in different vpc can communicate each other