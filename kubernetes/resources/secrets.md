#### [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

Confidential secrets or env variables needed for your app to run. Secrets should be encoded in base64.

## How to create secrets
There are two ways to create secrets:
- Automatically: specify file(s) that have the sensitive data
```yaml
kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt
```

- Manually: create the secret in a JSON or YAML file and `apply` it.
```yaml
kubectl apply -f <path_to_secret_file.yaml>

# get the secret
kubectl get secret <secret_name> -o yaml

# decode the secret gotten above and echo the value
echo 'MWYyZDFlMmU2N2Rm' | base64 --decode
```

Using just the data
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4=
  password: MWYyZDFlMmU2N2Rm
```


```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
stringData:
  secret.json: |-
    {
      "api_key" : "somesecretgoeshere"
    }

# kubectl create secret generic mysecret --from-file secrets/secret.json
```
