#!/bin/bash

kind create cluster --config cluster.yaml --name dev
kind create cluster --config cluster.yaml --name prod


# How multiple cluster works with kubeconfig
# How clusters in different vpc can communicate each other