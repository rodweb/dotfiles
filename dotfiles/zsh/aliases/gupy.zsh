alias dbdev='pgcli -h localhost -U postgres gupy_development'
alias dbtest='pgcli -h localhost -U postgres gupy_test'
alias dbread='pgcli -h db-prod-ro.data.gupy.io -U rodrigo_campos gupy_production'
alias dbprod='pgcli -h db-prod.data.gupy.io -U rodrigo_campos gupy_production'
alias dbcold='pgcli -h db-cold.data.gupy.io -U rodrigo_campos gupy_production'

alias vpn='sudo openvpn $HOME/.vpn/rodrigo.campos.ovpn'

# count 
# k get pods | grep -i companies | grep -i running | awk '{s+=$4} END {print s}'
