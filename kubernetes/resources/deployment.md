#### [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

Kubernetes deployments are all about `desired state`, declaring to the cluster how you want your containers to operate or function.

Here, you can define the version you want running, number of instances, spin up a new instance if one dies, autoscale as traffic goes up/down, etc (i.e. desired state). Kubernetes constantly looks at the `actual state` and ensures that it matches the `desired state`.

A Kubernetes deployment is a type of object that describes the `desired state` of our system.

An example deployment file looks like this:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata: # basic meta data about the deployment
  name: example-deploy
  labels:
    app: example-app
  annotations:
spec:
  selector:
    matchLabels:
      app: example-app
  replicas: 2 # we want two replicas running
  strategy:
    type: RollingUpdate # when there are upgrades, k8s will gracefully roll it out
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        app: example-app
    spec:
      containers:
      - name: example-app
        image: jherey/nodejs:v1 # use this docker image
        imagePullPolicy: Always
        ports:
        - containerPort: 5000 # port to be exposed
        livenessProbe: # constantly check/monitor/probe if the server is up
          httpGet:
            path: /status
            port: 5000
          initialDelaySeconds: 3
          periodSeconds: 3
        resources: # define resource limits for this deployment so it doesn't use too much/all resources
          requests:
            memory: "64Mi"
            cpu: "10m"
          limits:
            memory: "256Mi"
            cpu: "500m"
        env:
          - name: NODE_ENV
            value: "dev"
          - name: PORT
            value: "5000"
          - name: API_KEY
            valueFrom:
              secretKeyRef:
                name: <secret_name> # name you used in creating a secret e.g my-secret
                key: <secret_key> # e.g. MY_API_KEY
        #Use this method or pass in the env variable directly into the pod
        #NOTE: comment out `volumeMounts` section for configmap and\or secret guide
        # volumeMounts:
        # - name: secret-volume
        #   mountPath: /secrets/
        # - name: config-volume
        #   mountPath: /configs/
      #NOTE: comment out `volumes` section for configmap and\or secret guide
      # volumes:
      # - name: secret-volume
      #   secret:
      #     secretName: mysecret
      # - name: config-volume
      #   configMap:
      #     name: example-config # name of our config object

```

A pod is like a virtual machine, a traditional server that we're used to. Containers always run inside of pods. Pods can have multiple containers (kind of an advanced use-case), it gives us the flexibility to run whatever we want to inside a virtual machine. One can be a redis cache, a monitoring server, etc.

A deployment is how we want the application to be deployed. Inside the deployment is the pod spec (L31), where the pod is defined.
