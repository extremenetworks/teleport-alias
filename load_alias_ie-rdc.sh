alias flink='kubectl -n ie exec flink-jobmanager-0 -c jobmanager -- flink '
alias flink-cancel='kubectl -n ie exec flink-jobmanager-0 -c jobmanager -- flink cancel '
alias flink-list='kubectl -n ie exec flink-jobmanager-0 -c jobmanager -- flink list '
alias flink-run='kubectl -n ie exec flink-jobmanager-0 -c jobmanager -- flink run '
alias k='kubectl -n ie'
alias k3='kubectl -n a3-ie'
alias kc='kubectl -n common'
alias kd='kubectl -n xcd'
alias kg='kubectl -n guest'
alias kl='kubectl -n eloc'
alias klo='kubectl -n loki'
alias km='kubectl -n monitoring'
alias kmsp='kubectl -n msp4xiq'
alias kn='kubectl -n nvo'
alias kp='kubectl -n ie-portal'
alias ks='kubectl -n sdwan'
alias kubectl-a3='kubectl -n a3-ie'
alias kubectl-metrics='kubectl -n global-metrics'
alias kubectla3='kubectl --kubeconfig /root/.kube/config.a3 -n cloud-ie'
alias kw='kubectl -n wips'