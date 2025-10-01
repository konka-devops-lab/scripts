#!/bin/bash

run_cmd() {
  local cmd="$1"
  echo "Do you want to run: $cmd ? (y/n)"
  read -r answer
  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    eval "$cmd &"
    echo "✅ Started: $cmd"
  else
    echo "❌ Skipped: $cmd"
  fi
}

run_cmd "kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8080:80"
run_cmd "kubectl port-forward svc/prometheus-grafana -n monitoring --address 0.0.0.0 8081:80"
run_cmd "kubectl port-forward svc/nginx-kibana -n logging --address 0.0.0.0 8082:80"
run_cmd "kubectl port-forward svc/dev-frontend -n instana --address 0.0.0.0 8083:80"
run_cmd "kubectl port-forward svc/kiali -n istio-system --address 0.0.0.0 8084:20001"



# sudo lsof -t -i:8080 -i:8081 -i:8082 -i:8083 -i:8084 | xargs -r sudo kill -9
# sudo netstat -tulnp | grep -E '8080|8081|8082|8083|8084'
