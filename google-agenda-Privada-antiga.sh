# Adiciona à agenda 'Aulas+Reuniões'
# Exemplo:
#   google-agenda.sh 'Reunião-Aproveitamento' '20/02 12h15'
# Adiciona data em português e o ano atual, e suporta horário
d=${2:0:2}
m=${2:3:2}
hora=${2:6:5}
data=$m'/'$d'/'$(date +%Y)
gcalcli --cal 'Aulas+Reuniões' add --title "$1" --when "$data\ ${hora/h/':'}" --duration 60 --reminder 120
