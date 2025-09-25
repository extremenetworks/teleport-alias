kubectl get ns debug >/dev/null 2>&1 || kubectl create ns debug

pod_name=$(whoami)-middleware-debug-pod
namespace="debug"
image="081731760779.dkr.ecr.us-east-1.amazonaws.com/xcloudiq/middleware-access-util:25.9.1"

status=$(kubectl get pod "$pod_name" -n "$namespace" -o jsonpath='{.status.phase}' 2>/dev/null)
if [ "$status" != "Running" ]; then
    kubectl delete pod "$pod_name" -n "$namespace" --force --grace-period=0 2>/dev/null
    sleep 3
    kubectl run "$pod_name" -n "$namespace" --image="$image" --restart=Never --image-pull-policy=Always --rm -it -- bash
else
    kubectl exec -it "$pod_name" -n "$namespace" -- bash
fi
