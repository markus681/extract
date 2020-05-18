#!/bin/bash
# Dateien Entpacken

echo "Unrar (1), P7zip (2)"
read -n 1 prog

if [ "$prog" = "1" ]
then

	echo "Normal entpacken (1), Normal mit Passwort entpacken (2), Multiarchive entpacken (3), Multiarchive mit Passwort entpacken (4)"
	read -n 1 extract

		if [ "$extract" = "1" ]
		then
			for arc in *.rar
			do
			unrar x "$arc"
			done
		fi

		if [ "$extract" = "2" ]
		then
			echo "Enter Passwort"
			read passwd
			for arc in *.rar
			do
			unrar x -p$passwd "$arc"
			done
		fi

		if [ "$extract" = "3" ]
		then
			echo "Welches Format [part1.rar (1), part01.rar (2), part001.rar (3)]"
			read -n 1 wformat

				if [ "$wformat" = "1" ]
				then
					for arc in *.part1.rar
					do
					unrar x "$arc"
					done
				fi

				if [ "$wformat" = "2" ]
				then
					for arc in *.part01.rar
					do
					unrar x "$arc"
					done
				fi

				if [ "$wformat" = "3" ]
				then
					for arc in *.part001.rar
					do
					unrar x "$arc"
					done
				fi
		fi

		if [ "$extract" = "4" ]
		then
		    echo "Welches Format [part1.rar (1), part01.rar (2), part001.rar (3)]"
		    read -n 1 wformat

		        if [ "$wformat" = "1" ]
		        then
			        echo "Enter Passwort"
			        read passwd
	                for arc in *.part1.rar
	                do
	                unrar x -p$passwd "$arc"
	                done
		        fi

		        if [ "$wformat" = "2" ]
		        then
			        echo "Enter Passwort"
			        read passwd
	                for arc in *.part01.rar
	                do
	                unrar x -p$passwd "$arc"
	                done
		        fi
	
				if [ "$wformat" = "3" ]
		        then
			        echo "Enter Passwort"
			        read passwd
	                for arc in *.part001.rar
	                do
	                unrar x -p$passwd "$arc"
	                done
			    fi
		fi
fi

if [ "$prog" = "2" ]
then

	echo "Normal entpacken (1), Normal mit Passwort entpacken (2), Multiarchive entpacken (3), Multiarchive mit Passwort entpacken (4)"
	read -n 1 extract

		if [ "$extract" = "1" ]
		then
			for arc in *.rar
			do
			7z x "$arc"
			done
		fi
	
		if [ "$extract" = "2" ]
		then
			echo "Enter Passwort"
			read passwd
			for arc in *.rar
			do
			7z x -p$passwd "$arc"
			done
		fi

		if [ "$extract" = "3" ]
		then
			echo "Welches Format [part1.rar (1), part01.rar (2), part001.rar (3)]"
			read -n 1 wformat

				if [ "$wformat" = "1" ]
				then
					for arc in *.part1.rar
					do
					7z x "$arc"
					done
				fi

				if [ "$wformat" = "2" ]
				then
					for arc in *.part01.rar
					do
					7z x "$arc"
					done
				fi

				if [ "$wformat" = "3" ]
				then
					for arc in *.part001.rar
					do
					7z x "$arc"
					done
				fi
		fi

		if [ "$extract" = "4" ]
		then
		    echo "Welches Format [part1.rar (1), part01.rar (2), part001.rar (3)]"
		    read -n 1 wformat

			    if [ "$wformat" = "1" ]
			    then
			        echo "Enter Passwort"
			        read passwd
		            for arc in *.part1.rar
			        do
			        7z x -p$passwd "$arc"
			        done
				fi

				if [ "$wformat" = "2" ]
				then
				    echo "Enter Passwort"
				    read passwd
			        for arc in *.part01.rar
			        do
			        7z x -p$passwd "$arc"
			        done
				fi

				if [ "$wformat" = "3" ]
			    then
				    echo "Enter Passwort"
				    read passwd
	                for arc in *.part001.rar
	                do
	               7z x -p$passwd "$arc"
	               done
				fi
		fi
fi
