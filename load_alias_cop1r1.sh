alias k='kubectl -n cop1r1'
alias k3='kubectl -n a3-cop1r1'
alias kp='kubectl -n cop1r1-portal'
alias kg='kubectl -n guest'
alias kl='kubectl -n eloc'
alias klo='kubectl -n wips'
alias kc='kubectl -n common'
alias kd='kubectl -n xcd'
alias psqlargodb='kubectl -n argo exec -it argo-postgresql-ha-postgresql-0 -c postgresql -- bash -c PGPASSWORD=aerohive psql -h localhost -U postgres'
alias psqlconfigdb_1='psql -h aurora-cop1r1.cluster-ciwa6umsjipp.us-east-2.rds.amazonaws.com -U configuser_1 configdb_1'
alias psqlconfigdb_2='psql -h localhost -U configuser_1 configdb_1'
alias psqlconfigdb_3='psql -h localhost -U configuser_1 configdb_1'
alias psqlodidb='psql -h localhost -U techops odi'
alias psqlreportdb='psql -h localhost -U techops report'
alias psqlscheduledb='psql -h aurora-cop1r1.cluster-ciwa6umsjipp.us-east-2.rds.amazonaws.com -U scheduleuser scheduledb'
alias psqlsystemdb='psql -h aurora-cop1r1.cluster-ciwa6umsjipp.us-east-2.rds.amazonaws.com -U systemuser systemdb'
