# 1. Get Cluster Information
kubectl get all

# 2. Add each file in order
kubectl apply -f postgres-config.yml
kubectl apply -f postgres-secrets.yml
kubectl apply -f postgres.yml

# 3. Get Cluster Information with all resources
kubectl get all

# 4. Describe service for troubleshooting
kubectl describe deployment.apps/postgres-deployment
kubectl logs pod/postgres-deployment-7bf76bffb5-fcv8j

# 5. Add PGAdmin service
kubectl apply -f pgadmin-secrets.yml
kubectl apply -f pgadmin.yml

# 6. Access exposed service
minikube service pg-admin-service
# Or use kubectl port-forward (useful if port 80 is already used)
kubectl port-forward service/pg-admin-service 8080:80
# Or
while true; do kubectl port-forward service/pg-admin-service 8080:80; echo .; done