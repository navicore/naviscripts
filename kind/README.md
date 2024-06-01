configure local k8s via:

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
networking:
  apiServerAddress: "0.0.0.0"  # Listen on all interfaces
  apiServerPort: 6443          # Default port
```

```bash
# if not installed:
brew install colima
#create docker env via:
colima start --cpu 2 --memory 8 --disk 50

#create k8s kind cluster via:
kind create cluster --config cluster.yaml --name santacruze-k8s
```

