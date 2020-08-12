#### Introduction
Kubernetes is an orchestrator for microservice apps that run on containers.

A Kubernetes cluster is just an endpoint to where the cluster is located. In other words, a Kubernetes environment.

A Kubernetes context is a configuration that points you to a cluster.

Resources are:
- namespace: this is like a project group or a group of objects. Resources are typically scoped to namespaces.
- deployments: this is just a manifest file that describes the desired state of our apps.
- services: it is also a load balancer, it defines how kubernetes should serve the app internally or to the public.


## Configs

```
kubectl config

#${HOME}/.kube/config
#kubectl config --kubeconfig="C:\someotherfolder\config"
#$KUBECONFIG

```

### contexts

```
#get the current context
kubectl config current-context

#get and set contexts
kubectl config get-contexts
kubectl config use-context

```

## GET commands - retrieve kube resources
```
kubectl get <resource>

#examples
kubectl get pods
kubectl get deployments
kubectl get services
kubectl get configmaps
kubectl get secrets
kubectl get ingress

```

## Namespaces

```
kubectl get namespaces
kubectl create namespace test
kubectl get pods -n test

```

## Describe command

Used to troubleshoot states and statuses of objects

```
kubectl describe <resource> <name>
```

## Version

```
kubectl version
```
