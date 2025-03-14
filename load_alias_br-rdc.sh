alias debezium='kubectl -n br exec default-kafka-0 -c kafka -- bash -c '\''unset JMX_PORT;kafka-console-consumer.sh --bootstrap-server  default-kafka:9092 --from-beginning --topic configdb.public.hm_alert_policy'\'''
alias flink='kubectl -n br exec flink-jobmanager-0 -c jobmanager -- flink '
alias flink-cancel='kubectl -n br exec flink-jobmanager-0 -c jobmanager -- flink cancel '
alias flink-list='kubectl -n br exec flink-jobmanager-0 -c jobmanager -- flink list '
alias flink-run='kubectl -n br exec flink-jobmanager-0 -c jobmanager -- flink run '
alias k='kubectl -n br'
alias k3='kubectl -n a3-br'
alias kc='kubectl -n common'
alias kd='kubectl -n xcd'
alias kg='kubectl -n guest'
alias kl='kubectl -n eloc'
alias klo='kubectl -n loki'
alias km='kubectl -n monitoring'
alias kmsp='kubectl -n msp4xiq'
alias kn='kubectl -n nvo'
alias kp='kubectl -n br-portal'
alias ksys='kubectl -n kube-system'
alias kubectl-a3='kubectl -n a3-br'
alias kubectl-metrics='kubectl -n global-metrics'
alias kw='kubectl -n wips'