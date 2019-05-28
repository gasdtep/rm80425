R_ORIG="cd /etc/backup"
DIR_DEST="/etc/backup"
BKP_NAME="bckpvictorossi.tgz"

# compactacao do diretorio de origem diretamente no diretorio de destino
tar -czpf ${DIR_DEST}${BKP_NAME} ${DIR_ORIG} /etc

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretorio: ${DIR_ORIG}"
echo "Destino: ${DIR_DEST}${BKP_NAME}";
exit 0

Date=(date '+%d-%m-%y') cria essa linha dps da um echo nela: echo "data corrente:$Date" e no tar da um  ${Date}

-------------------------------------------------------------------- backup Apache: ---------------------------------

#!/bin/sh
#
# Cr?ditos do script, vers?o, etc.
#

# Confs do script
# Onde, DIR_ORIG ? o diretorio a ser backupeado, BKP_NAME o nome do backup
# arquivo de backup a ser criado, HTTPD_HOST o endereco do servidor de 
# HTTPD e, HTTPD_USER e HTTPD_PASS sao respectivamente o usuario e a senha a 
# serem usados para logarmos no servidor de HTTPD.

#baixando servidor apache
yum_install && update httpd2 -y


DIR_ORIG="cd /etc/backup"
BKP_NAME="bckpvictorossi.tgz"
HTTPD_HOST="servidor.com.br"

# compactacao do diretorio de origem
tar -czpf ./${BKP_NAME} ${DIR_ORIG}

# envio para o HTTPD, onde neste caso, abrimos a conexao com o servidor, 
# diretorio home do usuario do HTTPD.
httpd2 -in <<EOF
open $HTTPD_HOST
bin
hash
prompt
put $BKP_NAME
bye
EOF

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diret?rio: ${DIR_ORIG}"
echo "Destino: ${HTTPD_HOST}/${HTTPD_NAME}";
exit 0

crontab -e 


# gravação dos logs
if [ $? == '0' ]; then
	echo "Backup executado com sucesso >> /var/log/backup.log
	else
	echo "Falha na execução" >> /var/log/backup.log
fi

Date=(date '+%d-%m-%y') cria essa linha dps da um echo nela: echo "data corrente:$Date" e no tar da um  ${Date}
