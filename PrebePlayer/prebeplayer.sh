#!/bin/bash
# Script de prueba de PrebePlayer

clear
while [ $(dpkg -l | grep -c mpg123) -eq 0 ]
do
	echo -e "\e[1;31m\t No se ha encontrado el programa mpg123 \e[0m"	#Sino, no se encontró y...
	echo -ne "\e[1;32m\t ¿Desea instalarlo? \e[0m"
	echo -e "\e[1;32m\t [Y/N] \e[0m"
	echo -ne "\t >> "
	read opt
	case $opt in
		y|Y)
			sudo apt-get install mpg123							#... lo instala
			echo -e "\e[1;32m\t INSTALACIÓN COMPLETADA \e[0m"
		;;
		n|N)
			echo -e "\e[1;32m\t Tal vez para la próxima. Hasta luego... \e[0m"
			sleep 2
			exit
		;;
		*)
			echo -e "\e[1;31m\t Opción no valida \e[0m"
			sleep 1
			clear
		;;
	esac
done
echo -e "\e[1;34m\t Abriendo PrebePlayer V1.0.0 \e[0m"
sleep 2


exit_value=0													#Valor inicial de una variable de salida para el ciclo siguiente

clear
while [ $exit_value -ne 1 ]										#Ciclo en el que se tendrán las opciones de control del reproductor
do
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_ BIENVENIDO AL PREBEPLAYER -_-_-_-_-_-_-_-_-_|\e[0m"
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 1) Reproducir lista de la carpeta actual                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 2) Cambiar de carpeta                                   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 3) Subir una carpeta                                    -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 4) Listar archivos y subcarpetas de la carpeta actual   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 5) Mostrar las opciones del reproductor                 -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 6) Salir del reproductor                                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_------------------Reproduciendo ahora------------------_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_--------------------Carpeta actual---------------------_-_-|\e[0m"
	echo -e "\e[31m\t >> `pwd` << \e[0m"
	
	echo -ne "\tOpción >> "
	read opt
	case $opt in
		1)
			echo -e "\e[1;32m\t Reproduciendo la lista... \e[0m"
			sleep 1
			mpg123 $pwd
		;;
		
		2)
			echo -e "\e[1;32m\t Indique una ruta o la carpeta a la que desea ingresar de la siguiente lista: \e[0m"
			ls -d */
			echo -ne "\t >> "
			read carpeta
			cd $carpeta
			echo -e "\e[1;32m\t Cambiando de carpeta... \e[0m"
			sleep 1
			clear
		;;
		
		3)
			echo -e "\e[1;32m\t Subiendo carpeta... \e[0m"
			sleep 1
			cd ..
			clear
		;;
		
		4)
			echo -e "\e[1;32m\t Listando archivos... \e[0m"
			sleep 1
			echo -e "\t `ls`"
			echo -e "\n\t SI DESEA REPRODUCIR ALGUNA CANCIÓN, INGRESE SU NOMBRE, SINO SOLO PRESIONE ENTER"
			echo -ne "\t >> "
			read song
			echo "$song"
			if [[ -n "$song" ]];then							#Si song es una cadena no vacía
				if [ $(ls | grep -c "$song") -ne 0 ]; then		#Si el número de coincidencias de esa cadena es mayor que cero
					mpg123 $song								#Se reproduce la canción
					clear
				else
					echo -e "\e[31m\t La canción no se encuentra dentro del directorio \e[0m"
				fi
			else												#Si es vacía, sólo se presionó ENTER
				clear
			fi
		;;
		
		5)
			echo -e "\e[1;32m\t Cargando opciones del reproductor... \e[0m"
			sleep 1
		;;
		
		6)
			echo -e "\e[1;32m\t Saliendo... \e[0m"
			sleep 1
			exit 0
		;;
		
		*)
			echo -e "\e[31m\t Opción no válida. Intente de nuevo... \e[0m"
			sleep 1
		;;
	esac


	exit_value=0
done

exit