kubectl get ns debug >/dev/null 2>&1 || kubectl create ns debug
kubectl -n debug run -it $(whoami)-middleware-debug-pod --image=081731760779.dkr.ecr.us-east-1.amazonaws.com/xcloudiq/middleware-access-util:25.8.0-3 --restart=Never --rm -- bash
