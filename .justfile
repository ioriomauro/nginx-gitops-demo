# nginx-gitops-demo: local helpers. Nothing here touches a cluster.

stages := "dev qa prod"

# List recipes
default:
    @just --list --unsorted

# Render one stage to stdout, e.g. `just render dev`
render stage:
    kustomize build stages/{{ stage }}

# Render every stage and fail on the first error
check:
    #!/usr/bin/env bash
    set -euo pipefail
    for s in {{ stages }}; do
        kustomize build "stages/$s" > /dev/null && echo "ok: stages/$s"
    done
