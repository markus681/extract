#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "${menu}Programm zum ENTPACKEN"
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} UNRAR / PW ${normal}\n"
    printf "${menu}**${number} 2)${menu} P7zip / PW ${normal}\n"
    printf "${menu}**${number} 3)${menu} UNRAR PART / PW ${normal}\n"
    printf "${menu}**${number} 4)${menu} P7zip PART / PW ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Option 1 Picked";
            echo "Mit Passwort entpacken? (y/n)"
            read pw
            echo "Welches Archive format?"
            read ext
            if [ "$pw" = "y" ]
            then
                echo "Enter Passwort"
                read passwd
                for arc in *.$ext
                do
                    unrar x -p$passwd "$arc"
                done
            fi
            if [ "$pw" = "n" ]
            then
                for arc in *.$ext
                do
                    unrar x "$arc"
                done
            fi
            printf "#UNRAR / PW";
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            echo "Mit Passwort entpacken? (y/n)"
            read pw
            echo "Welches Archive format?"
            read ext
            if [ "$pw" = "y" ]
            then
                echo "Enter Passwort"
                read passwd
                for arc in *.$ext
                do
                    7z x p$passwd "$arc"
                done
            fi
            if [ "$pw" = "n" ]
            then
                for arc in *.$ext
                do
                    7z x "$arc"
                done
            fi
            printf "#P7zip / PW";
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            echo "Mit Passwort entpacken? (y/n)"
            read pw
            echo "Welches Archive format?"
            read ext
            if [ "$pw" = "n" ]
            then
                if [ "$ext" = "rar" ]
                then
                    echo "Wieviele Pakete? part1/part01/part001"
                    read pak
                    if [ "$pak" = "1" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x "$arc"
                        done
                    fi
                    if [ "$pak" = "01" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x "$arc"
                        done
                    fi
                    if [ "$pak" = "001" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x "$arc"
                        done
                    fi
                else
                    echo "Wie sieht das format aus?"
                    read form
                    for arc in *.$form.$ext
                    do
                        unrar x "$arc"
                    done
                fi
            fi
            if [ "$pw" = "y" ]
            then
                if [ "$ext" = "rar" ]
                then
                    echo "Wieviele Pakete? part1/part01/part001"
                    read pak
                    if [ "$pak" = "1" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x -p$passwd "$arc"
                        done
                    fi
                    if [ "$pak" = "01" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x -p$passwd "$arc"
                        done
                    fi
                    if [ "$pak" = "001" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            unrar x -p$passwd "$arc"
                        done
                    fi
                else
                    echo "Wie sieht das format aus?"
                    read form
                    for arc in *.$form.$ext
                    do
                        unrar x -p$passwd "$arc"
                    done
                fi
            fi
            printf "#UNRAR PART / PW";
            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            echo "Mit Passwort entpacken? (y/n)"
            read pw
            echo "Welches Archive format?"
            read ext
            if [ "$pw" = "n" ]
            then
                if [ "$ext" = "rar" ]
                then
                    echo "Wieviele Pakete? part1/part01/part001"
                    read pak
                    if [ "$pak" = "1" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x "$arc"
                        done
                    fi
                    if [ "$pak" = "01" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x "$arc"
                        done
                    fi
                    if [ "$pak" = "001" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x "$arc"
                        done
                    fi
                else
                    echo "Wie sieht das format aus?"
                    read form
                    for arc in *.$form.$ext
                    do
                        7z x "$arc"
                    done
                fi
            fi
            if [ "$pw" = "y" ]
            then
                if [ "$ext" = "rar" ]
                then
                    echo "Wieviele Pakete? part1/part01/part001"
                    read pak
                    if [ "$pak" = "1" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x p$passwd "$arc"
                        done
                    fi
                    if [ "$pak" = "01" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x p$passwd "$arc"
                        done
                    fi
                    if [ "$pak" = "001" ]
                    then
                        for arc in *.part$pak.rar
                        do
                            7z x p$passwd "$arc"
                        done
                    fi
                else
                    echo "Wie sieht das format aus?"
                    read form
                    for arc in *.$form.$ext
                    do
                        7z x p$passwd "$arc"
                    done
                fi
            fi
            printf "#P7zip PART / PW";
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
