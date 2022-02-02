#!/bin/bash


#colours

ma="\033[0;35m"
re="\033[1;31m" #red
ve="\033[1;32m"
am="\033[1;33m" #yellow
az="\033[1;34m"
br="\033[0;33m" #orange
e="\033[0m"    #no colours


f1() {
clear
sleep 0.05 && echo -e $ma    "## # # # # # #    $az     # # # # # # # # #      $am     ## # # # ##    "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##        ##   "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##         ##  "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##         ##  "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##        ##   "
sleep 0.05 && echo -e $ma    "## # # # # # #    $az            ##              $am     ## # # # ##    "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##             "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##              "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##               "
sleep 0.05 && echo -e $ma    "##                $az            ##              $am     ##                "
sleep 0.05 && echo -e $ma    "##             $am @@$az            ##       @@     $am     ##                 "
sleep 0.05 && echo -e $ma    "               $am @@$az                     @@                            "
sleep 0.05 && echo -e $ma    ""
echo -e $e
echo -e $ve "!!! RUN IN ROOT TERMINAL TO AVOID ERRORS";
echo -e $e
echo Options
sleep 0.05 && echo -e $re "1.Download Filezilla server"
sleep 0.05 && echo -e $re "2.Start FTP server"
sleep 0.05 && echo -e $re "3.Stop FTP server"
sleep 0.05 && echo -e $re "4.Status of FTP server "
sleep 0.05 && echo -e $re "5.Open Admin Interface"
sleep 0.05 && echo -e $re "6.Open Filezilla Client Interface"
sleep 0.05 && echo -e $re "7.Check FTP ip address"
sleep 0.05 && echo -e $re "8.How to Install Filezilla Server"
sleep 0.05 && echo -e $re "9.exit"
echo -e $e
f11
}

fa() {
echo Options
sleep 0.05 && echo -e $re "1.Download Filezilla server"
sleep 0.05 && echo -e $re "2.Start FTP server"
sleep 0.05 && echo -e $re "3.Stop FTP server"
sleep 0.05 && echo -e $re "4.Status of FTP server "
sleep 0.05 && echo -e $re "5.Open Admin Interface"
sleep 0.05 && echo -e $re "6.Open Filezilla Client Interface"
sleep 0.05 && echo -e $re "7.Check FTP ip address"
sleep 0.05 && echo -e $re "8.How to Install Filezilla Server"
sleep 0.05 && echo -e $re "9.exit"
echo -e $e
f11
}

    f11(){
    read -p "Enter Option :" option
    if [ $option -eq 1 ]
    then
    a1
    elif [ $option -eq 2 ]
    then
    a2
    elif [ $option -eq 3 ]
    then
    a3
    elif [ $option -eq 4 ]
    then
    a4
    elif [ $option -eq 5 ]
    then
    a5
    elif [ $option -eq 6 ]
    then
    a6
    elif [ $option -eq 7 ]
    then
    a7
    elif [ $option -eq 8 ]
    then
    a8
    elif [ $option -eq 9 ]
    then
    exit
    else
    echo Enter correct option
    sleep 0.6
    f11
    fi
    }

        a1() {
        wget https://github.com/nagesh-mk/Filezilla-server-for-Linux/raw/file/FileZilla_Server_1.2.0_x86_64-linux-gnu.deb
        mv FileZilla_Server_1.2.0_x86_64-linux-gnu.deb $HOME/Downloads
        chmod 777 $HOME/Downloads/FileZilla_Server_1.2.0_x86_64-linux-gnu.deb
        echo -e $am File Saved to $HOME/Downloads
        echo -e $e
        sleep 2
        fa
        }

        a2() {
        service filezilla-server start
        zenity --info --title="START" --text="FTP Server Started"
        f1
        }

        a3() {
        service filezilla-server stop
        zenity --info --title="START" --text="FTP Server Stopted"
        f1
        }

        a4() {
        echo  $(service filezilla-server status) > status
        rr=$(grep -o dead status)
        if [ -n "$rr" ]
        then
        echo -e FTP server $re Not Running"(inactive)"$e
        else
        echo -e FTP server is $am Running"(acitve)"$e
        echo FTP IP address $(hostname -I | awk '{ print $1  }')
        echo Default FTP port 21
        fi
        rm status
        sleep 2
        fa
        }

        a5() {
        service filezilla-server start
        /opt/filezilla-server/bin/filezilla-server-gui
        f1
        }

        a6() {
        echo ""
        echo -ne "Filezilla....."
        if ! hash filezilla 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		zenity --error --text="Install Filezilla Client"
		sleep 1
		a61
		exit
        else
		echo -e "\e[1;32mOK!"$rescolor""
		sleep 1
		a62
        fi
        }

            a61() {
            echo -e $e
            read -p "Install filezilla Client?[y or n]": ftp
            if [ $ftp == y ]
            then
            sudo apt install filezilla
            clear
            filezilla
            f1
            elif [ $ftp == n ]
            then
            f1
            else
            f1
            fi

            }

            a62() {
            filezilla
            f1
            }

        a7() {
        hostname -I | awk '{ print $1  } { print $2 } { print $3 } { print $4 }'
        sleep 2
        fa

        }

        a8() {
        echo -e $am"!!!RUN AS ROOT
        1.Download FileZilla server deb file from Option 1 or form https://filezilla-project.org/download.php?type=server

        2.install gdebi
        #sudo apt install gdebi

        3.install Filezilla from gdebi
        #sudo gdebi <filename>.deb

        ##############################
        1.start admin interface
        2.connect Hostname:127.0.0.1 Port:14148
        3.Server > Configure >Users >Add >Enter mount path >ok
        4.Server > Configure >Users >password>ok"$e
        sleep 2
        fa
        }

f0() {
echo ""
echo -ne "Zenity....."
if ! hash zenity 2>/dev/null; then
		echo -e "\e[1;31mNot installed"$rescolor""
		zenity --error --text="Install zenity"
		sleep 1
		sudo apt install zenity
		clear
		exit
	else
		echo -e "\e[1;32mOK!"$rescolor""
		sleep 1
	fi
	f1
	}


suser() {
if [ $(id -u) -ne 0 ]; then
  echo "Run as root"
  zenity --error --text="Run as Root to avoid ERRORS"
  f0
  fi
f0
}

suser


