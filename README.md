# chart-chartmuseum

This repository contains 1 chart that is used to deploy chartmuseum to kubernetes.

- chartmuseum

## Installing

Install `chartmuseum` chart

```bash
helm install --name chartmuseum chartmuseum/chartmuseum
```

It can also be installed from public helm charts repo.

```bash
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm repo update

helm install stable/chartmuseum
```