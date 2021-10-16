# kubectl Docker Image

Mixed architecture ansible image based on alpine

Contain kubectl and python3. Runs kubectl by default

```
docker run --rm -it -v /path/to/kube/config/file:/root/.kube/config  raquette/kubectl:edge get po -A
```

