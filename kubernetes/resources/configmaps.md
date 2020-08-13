A ConfigMap basically helps to store non-confidential data in key-value pairs.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: example-config
data:
  config.json: |
    {
      "environment" : "dev"
    }
# kubectl create configmap example-config --from-file ./golang/configs/config.json
```
