# chart-chartmuseum

This repository contains 2 charts that are used to deploy chartmuseum to kubernetes.

- chartmuseum-storage
- chartmuseum

## Installing

First install `chartmuseum-storage` chart

```bash
helm install --name chartmuseum-storage chartmuseum/chartmuseum-storage
```

After that, install `chartmuseum` chart

```bash
helm install --name chartmuseum chartmuseum/chartmuseum
```