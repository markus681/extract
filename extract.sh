#!/bin/bash
# Dateien Entpacken

PS3='Mit welchem Programm entpacken: '
prog=("Unrar" "P7zip" "Ende")
select pro in "${prog[@]}"
do
	case $pro in
		"Unrar")
		PS3='Welches Format soll entpackt werden: '
		optf=(".rar" ".zip" ".tar" "Enter Format" "Ende")
		select ext in "${optf[@]}"
		do
			case $ext in
				".rar")
				PS3='Was soll entpackt werden: '
				optw=("Normal entpacken" "Normal mit PW entpacken" "Multiarchive entpacken" "Multiarchive mit PW entpacken" "Ende")
				select form in "${optw[@]}"
				do
					case $form in
						"Normal entpacken")
						for arc in *.rar
						do
						unrar x "$arc"
						done
						;;
						
						"Normal mit PW entpacken")
						echo "Passwort eingeben: "
						read passwd
						for arc in *.rar
						do
						unrar x p$passwd "$arc"
						done
						;;
						
						"Multiarchive entpacken"
						PS3='Welches Multiarchive: '
						marc=("part1.rar" "part01.rar" "part001.rar" "Ende")
						select part in "${marc[@]}"
						do
							case $part in
								"part1.rar")
								for arc in *.part1.rar
								do
								unrar x "$arc"
								done
								;;
								
								"part01.rar")
								for arc in *.part01.rar
								do
								unrar x "$arc"
								done
								;;
								
								"part001.rar")
								for arc in *.part001.rar
								do
								unrar x "$arc"
								done
								;;
								
								"Ende")
								break
								;;
								
							esac
						done
						
						"Multiarchive mit PW entpacken")
						echo "Passwort eingeben: "
						read passwd
						PS3='Welches Multiarchive: '
						marc=("part1.rar" "part01.rar" "part001.rar" "Ende")
						select part in "${marc[@]}"
						do
							case $part in
								"part1.rar")
								for arc in *.part1.rar
								do
								unrar x $passwd "$arc"
								done
								;;
								
								"part01.rar")
								for arc in *.part01.rar
								do
								unrar x $passwd "$arc"
								done
								;;
								
								"part001.rar")
								for arc in *.part001.rar
								do
								unrar x $passwd "$arc"
								done
								;;
								
								"Ende")
								break
								;;
								
							esac
						done
					esac
				done
