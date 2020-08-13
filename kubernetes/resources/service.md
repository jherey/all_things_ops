#### [Services](https://kubernetes.io/docs/concepts/services-networking/service/#:~:text=In%20Kubernetes%2C%20a%20Service%20is,usually%20determined%20by%20a%20selector)

In the traditional networking world, applications talk to each other over IP addresses. This isn't a good practice because IP addresses change often. So instead DNS (Domain Name System) is used, which is a name that gets resolved to an IP address(es). This requires some form of human management.

Also, there's a need for load balancing, so we point the load balancer to the DNS and then to the application. Mistakes are bound to happen as it's managed by humans.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: example-service
  labels:
    app: example-app
spec:
  type: LoadBalancer
  selector:
    app: example-app # use this service for pods that have the `example-app` label
  ports:
    - protocol: TCP
      name: http
      port: 80 # external port to access the pods
      targetPort: 5000
```
