# daily_used_scripts# scripts

# 12-11-2025[handling multiple clusters and ns]
1. create 2 kind clusters using kind
2. go through config using kubectl config view
3. Switch between 2 clusters
4. creating ns in each clusters cluster-1 expense instana monitoring and cluster-2 sbi flipkart monitoring
5. switch to cluster and particular ns
   kubectl config use-context dev 
   kubectl config set-context --current --namespace=instana
6. Deploy the workloads on each ns

kubectl run expense-app -n expense --image=nginx --restart=Never --port=80
kubectl expose pod expense-app -n expense --name=expense-service --port=8080 --target-port=80

kubectl run instana-app -n instana --image=nginx --restart=Never --port=80
kubectl expose pod instana-app -n instana --name=instana-service --port=8080 --target-port=80

kubectl run monitoring-app -n monitoring --image=nginx --restart=Never --port=80
kubectl expose pod monitoring-app -n monitoring --name=monitoring-service --port=8080 --target-port=80

kubectl run sbi-app -n sbi --image=nginx --restart=Never --port=80
kubectl expose pod sbi-app -n sbi --name=sbi-service --port=8080 --target-port=80

kubectl run flipkart-app -n flipkart --image=nginx --restart=Never --port=80
kubectl expose pod flipkart-app -n flipkart --name=flipkart-service --port=8080 --target-port=80

kubectl run monitoring-app -n monitoring --image=nginx --restart=Never --port=80
kubectl expose pod monitoring-app -n monitoring --name=monitoring-service --port=8080 --target-port=80

7. Resource Quotas
8. Limit Ranges
9. RBAC