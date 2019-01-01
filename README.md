# kubernetes-manifests
kubernetes-manifests for me

## deploy concourse
### generate secretes
```bash
$ ./scripts/gen-secret-postgredql.sh
$ ./scripts/gen-secret-web.sh
$ ./scripts/gen-secret-concourse.sh
```
### deploy(with kustomize)
```bash
$ kustomize build dev/concourse | kubectl apply -f -
```
### view from local
```bash
$ kubectl port-forward svc/concourse-web 8080:8080 2222:2222
```

access to http://localhost:8080
