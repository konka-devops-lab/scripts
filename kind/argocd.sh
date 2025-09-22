#!/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl create namespace monitoring
helm install prometheus oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --namespace monitoring


