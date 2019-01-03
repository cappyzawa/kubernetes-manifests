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

## deploy vault
### deploy(with kustomize)
```bash
$ kustomize build dev/vault/server/overlays | kubectl apply -f -
```
### operate from local
```bash
$ kubectl port-forward svc/vault 8200:8200
```

## deploy prometheus 
### deploy(with kustomize)
```bash
$ kustomize build dev/prometheus/overlays | kubectl apply -f -
```
### view from local
```bash
$ kubectl port-forward svc/prometheus 9090:9090
```
