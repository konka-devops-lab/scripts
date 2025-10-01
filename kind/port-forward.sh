#!/bin/bash
kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8080:80 &
kubectl port-forward svc/prometheus-grafana -n monitoring --address 0.0.0.0 8081:80 &
kubectl port-forward svc/nginx-kibana -n logging --address 0.0.0.0 8082:80 &
kubectl port-forward svc/dev-frontend -n instana --address 0.0.0.0 8083:80 &
kubectl port-forward svc/kiali -n istio-system --address 0.0.0.0 8084:20001 &