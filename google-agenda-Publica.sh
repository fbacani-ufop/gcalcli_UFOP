# Você deve instalar e configurar o gcalcli antes de utilizar este programa
#
# DESCRIÇÃO
# Inclui evento(s) na agenda de nome "Pública" de título $1 e datas/horas $2
# - Datas/horas nos formatos "dd/mm hh:mm"
# - Suporta horários como "12h05"
# - Suporta datas em português, e várias datas para o mesmo evento separadas 
#   por ponto e vírgula (;).
# - Suporta entrada de horário como turnos do ICEA. Exemplo:
#   - "1T" por '13h30'
#   - "2T" por '15h25'
#   - "1N" por '18h50'
#   - "2N" por '20h45'
#
# Exemplo de aplicação:
#   Incluir "Assembleias departamentais", nas três datas:
#    - 07/04 10:30
#    - 07/05 10:30
#    - 07/06 10:30
# google-agenda-Publica "Assembleias departamentais" "07/04 10:30; 07/05 10:30; 07/06 10:30"
#
# INÍCIO
# separa vetor de datas e horários
IFS=';'
datas=( ${2} )
for data_hora in "${datas[@]}"
do
  # trata cada elemento de data/hora e converte para o 
  d=${data_hora:0:2}
  m=${data_hora:3:2}
  hora=${data_hora:6:5}
  hora=${hora/1T/'13h30'}
  hora=${hora/2T/'15h25'}
  hora=${hora/1N/'18h50'}
  hora=${hora/2N/'20h45'}
  hora=${hora/h/':'}
  data=$m'/'$d'/'$(date +%Y)
  echo "$data $hora"
  gcalcli --cal 'Pública' add --title "$1" --when "$data $hora" --duration 50 --reminder 120
done
