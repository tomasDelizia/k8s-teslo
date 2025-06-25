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
kubectl logs -f pod/postgres-deployment-7bf76bffb5-fcv8j

# 5. Add PGAdmin service
kubectl apply -f pgadmin-secrets.yml
kubectl apply -f pgadmin.yml

# 6. Access exposed service
minikube service pg-admin-service
# Or use kubectl port-forward (useful if port 80 is already used)
kubectl port-forward service/pg-admin-service 8080:80
# Or
while true; do kubectl port-forward service/pg-admin-service 8080:80; echo .; done

# 7. Add Backend service
kubectl apply -f backend-secrets.yml
kubectl apply -f backend.yml

# 8. Access Backend service
minikube service backend-service
# Or
kubectl port-forward service/backend-service 3000:3000

# Other commands
# Restart all deployments
kubectl rollout restart deployment
# Restart a specific deployment
kubectl rollout restart deployment deployment.apps/postgres-deployment