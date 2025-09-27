#!/bin/bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm upgrade --install istio-base istio/base -n istio-system
helm upgrade --install istiod istio/istiod -n istio-system --wait
helm upgrade --install istio-ingressgateway istio/gateway -n istio-system
helm upgrade --install istio-egressgateway istio/gateway -n istio-system


echo "Add Kiali Helm repo and install Kiali"
helm repo add kiali https://kiali.org/helm-charts
helm repo update

helm upgrade --install kiali-server kiali/kiali-server \
  -n istio-system \
  --set auth.strategy="anonymous" \
  --set external_services.prometheus.url="http://prometheus-kube-prometheus-prometheus.monitoring.svc.cluster.local:9090" \
  --set external_services.grafana.external_url="http://prometheus-grafana.monitoring.svc.cluster.local:80"

# echo "Add Jaeger Helm repo and install Jaeger"

# helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
# helm repo update

# helm upgrade --install jaeger jaegertracing/jaeger \
#   -n istio-system \
#   --set storage.type=memory \
#   --set ui.enabled=true \
#   --set collector.enabled=true \
#   --set agent.enabled=true


# helm install jaeger jaegertracing/jaeger \
#   -n istio-system \
#   --set provisionDataStore.cassandra=false \
#   --set provisionDataStore.elasticsearch=false \
#   --set ui.enabled=true \
#   --set collector.enabled=true \
#   --set agent.enabled=true

