#!/bin/bash

nombre_usuario=Jose
temp_log=$(mktemp)
mkfifo pipeline

#Inicializo el telegram. A partir de ahora me comunico a traves del pipe
telegram -W < pipeline > $temp_log &
#echo -e "send_document Jose $@ \n" | telegram -W & > $temp_log
pid_telegram=$!
echo $@
for archivo in $@ ; do
	completado=0
	echo ; echo;
	echo "send_document $nombre_usuario $archivo \n"
	echo "send_document $nombre_usuario $archivo \n" > pipeline
	#Damos un margen para que empiece a subir el archivo
	while [[ $completado == 0 ]] ; do
		sleep 1
		completado=$(tail -n1 $temp_log | egrep -c '\[[0-9]+\%Up\]')
	done
	
	echo $completado "...................."

	#Espera hasta que acaba, comprobando el porcentaje completado en el log
	while [ "${completado:-NO_VALUE}" != "NO_VALUE" ] ; do
		sleep 1
		completado=$(tail -n1 $temp_log | egrep -o '\[[0-9]+\%Up\]' | egrep -o '[0-9]+')
		tail -n1 $temp_log		
	done

done


echo "quit" > pipeline
rm pipeline
#Todo ha ido bien
notify-send -i ok "TgYourself OK: $# archivos enviados"
