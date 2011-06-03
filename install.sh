#!/bin/bash


function uninstall {
	rm -fr ~/.config/css/
	rm -fr ~/.config/markdown2html
}

function install {
	whereis markdown | grep -q bin
	if [ $? -ne 0 ]
	then
		echo "Es necesario que instale el paquete markdown:
		
#En debian, trisquel,flujos, ubuntu y demas:
sudo apt-get install markdown

#En fedora, redhat, cenOS:
yum install markdown

Por favor instale markdown y vuelta a intentar
"
		exit 1;
	fi
	echo "INSTALANDO... "
	cp -r ./src/css/ ~/.config/
	cp ./src/markdown2html ~/.config/markdown2html
	chmod +x ~/.config/markdown2html
	~/.config/markdown2html ./doc/como_usar.md
	echo "Instalacion concluida por favor revise su navegador"
}


RETVAL=0
case "$1" in
   "") 
      echo "ERROR:
	Falta de argumento.
	Use: $0 [OPCIÓN]
DESCRIPCIÓN:
	instalador y desistalador de \"markdown to HTML\" 
OPCIONES DISPONIBLES:
	--install	Instala el \"markdown to HTML\" 
	 -i

	--uninstall	Desinstala el \"markdown to HTML\" 
	 -u
EJEMPLO:
	#Instalando \"markdown to HTML\" 
	$0 -i
	#Desinstalando \"markdown to HTML\" 
	$0 -i
"
      RETVAL=1
      ;;
   --install|-i)
      install
      ;;
   --uninstall|-u)
      uninstall
      ;;
esac

exit $RETVAL
