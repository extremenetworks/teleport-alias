kubectl get ns debug >/dev/null 2>&1 || kubectl create ns debug

pod_name=$(whoami)-middleware-debug-pod
namespace="debug"
image="081731760779.dkr.ecr.us-east-1.amazonaws.com/xcloudiq/middleware-access-util:25.9.1-14"
gcr_clusters=("ach-rdc" "aca-rdc")

current_cluster=$(tsh status 2>/dev/null | awk -F':' '/Kubernetes cluster/ {gsub(/^[ \t]+/, "", $2); print $2}')
if [[ -z "${current_cluster}" ]]; then
  echo "No active profile, please login kubernetes cluster first."
  echo "Usage: tkl <cluster>"
  exit 1
fi
current_cluster=$(echo "$current_cluster" | sed -E 's/^["[:space:]]+|["[:space:]]+$//g')
if [[ "${gcr_clusters[*]}" =~ "${current_cluster}" ]]; then
  image="gcr.io/prod-hm/xcloudiq/middleware-access-util:25.9.1-14"
fi

status=$(kubectl get pod "$pod_name" -n "$namespace" -o jsonpath='{.status.phase}' 2>/dev/null)
if [ "$status" != "Running" ]; then
    kubectl delete pod "$pod_name" -n "$namespace" --force --grace-period=0 2>/dev/null
    sleep 3
    kubectl run "$pod_name" -n "$namespace" --image="$image" --restart=Never --image-pull-policy=Always --rm -it -- bash
else
    kubectl exec -it "$pod_name" -n "$namespace" -- bash
fi
