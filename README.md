# nginx-gitops-demo

Small public repository used to practise GitOps promotion with Argo CD and Kargo.
It serves a static site with nginx.

## Layout

- `base/`: Kustomize base. Deployment, Service, and a ConfigMap generated from `base/html/`.
- `base/html/`: the static files nginx serves.
- `stages/dev|qa|prod/`: overlays that set the namespace and the Service port.
- `.justfile`: local render helpers (`just check`, `just render dev`).

## Branches

- `main`: sources. Edit HTML or the image tag here.
- `stage/dev`, `stage/qa`, `stage/prod`: rendered manifests written by Kargo promotions. Do not edit by hand. Argo CD tracks these.

## Stage ports on localhost

dev 8081, qa 8082, prod 8083.
