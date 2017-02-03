# Run Web App in local Kubernetes 

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

   * Deploy app into local k8s
```
./deploy
```

   * Check that pods were deployed
```
kubectl --all-namespaces=true get pods
```

   * Ping app
```
curl $(minikube ip)/api/ping
```

   * Obtain ip of local virtual machine with k8s and put it into browser
```
minikube ip
```

# Undeploy App from Minikube

   * Undeploy app from local k8s
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

# Deploy App to Google Container Engine

  * Install Goolge Cloud SDK [link](https://cloud.google.com/sdk/docs/quickstart-linux)
  
  * Build all Docker images and push them to Google Container Engine Repository
```  
./build-all-docker-images.sh -p
```
   * Deploy app into local k8s
```
./deploy
```

   * Check that pods were deployed
```
kubectl --all-namespaces=true get pods
```

  * Congratulation you just deploy your app in GKE, now obtain ip of machine where your app is running. You should go to Google Cloud Platfor and in Networking -> External Ip Addresses find desired ip.
