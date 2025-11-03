kubectl get ns debug >/dev/null 2>&1 || kubectl create ns debug

# Sanitize whoami output: convert to lowercase, replace invalid chars with hyphens, trim edges
pod_name=$(whoami | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' '-' | sed 's/-*$//;s/^-*//')-middleware-debug-pod
namespace="debug"

gcr_clusters=("aca-rdc" "ach-rdc" "agb-rdc" "af-rdc" "ava-rdc" "ia-gcp-rdc" "kc-rdc" "nl-gcp-rdc" "sg-gcp-rdc")

#default image version
default_version="25.9.1-15"
#cluster specific image versions, priority over default
cluster_versions="
  stage-rdc=25.9.4-20
"

current_cluster=$(tsh status 2>/dev/null | awk -F':' '/Kubernetes cluster/ {gsub(/^[ \t]+/, "", $2); print $2}')
if [[ -z "${current_cluster}" ]]; then
  echo "No active profile, please login kubernetes cluster first."
  echo "Usage: tkl <cluster>"
  exit 1
fi
current_cluster=$(echo "$current_cluster" | sed -E 's/^["[:space:]]+|["[:space:]]+$//g')

version="$default_version"
for kv in $cluster_versions; do
  key=${kv%%=*}
  val=${kv#*=}
  if [ "$key" = "$current_cluster" ]; then
    version="$val"
    break
  fi
done

image="081731760779.dkr.ecr.us-east-1.amazonaws.com/xcloudiq/middleware-access-util:${version}"

for cluster in "${gcr_clusters[@]}"; do
  if [ "$cluster" == "$current_cluster" ]; then
    image="gcr.io/prod-hm/xcloudiq/middleware-access-util:${version}"
    break
  fi
done

status=$(kubectl get pod "$pod_name" -n "$namespace" -o jsonpath='{.status.phase}' 2>/dev/null)
if [ "$status" != "Running" ]; then
    kubectl delete pod "$pod_name" -n "$namespace" --force --grace-period=0 2>/dev/null
    sleep 3
    kubectl run "$pod_name" -n "$namespace" --image="$image" --restart=Never --image-pull-policy=Always --rm -it -- bash
else
    kubectl exec -it "$pod_name" -n "$namespace" -- bash
fi