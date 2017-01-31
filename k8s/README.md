# Run SimpleCrudServer in local Kubernetes 

   * Install Minikube (https://github.com/kubernetes/minikube)
 
   * Start local Kubernetes (k8s)
```
minikube start
eval $(minikube docker-env)
```

   * Check that no pods are deployed yet
```
kubectl --all-namespaces=true get pods
```

   * Build all Docker images
```  
./build-all-docker-images.sh
```

   * Deploy SimpleCrudServer into local k8s
```
./deploy
```

   * Check that pods were deployed
```
kubectl --all-namespaces=true get pods
```

   * Obtain ip of local k8s
```
minikube ip
```

   * Ping SimpleCrudServer
```
curl $(minikube ip)/api/ping
```

   * Undeploy SimpleCrudServer from local k8s
```
./undeploy
```

   * Stop local k8s
```
minikube stop
```


   * Delete Minikube instance
```
minikube delete
```

