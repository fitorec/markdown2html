#Agregando funcionalidad al nautilus.

Necesitamos descargar:


Para hacer agregar una funcionalidad en el nautilus lo unico que tenemos que hacer es lo siguiente:

	if [ $# -ne 1 ]
	then
	  echo "requere del archivo para poder ejecutar"
	  exit $E_BADARGS
	fi

	rm -f /tmp/markdown.html

	echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>markdown file</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/home/fitorec/.config/css/chrome/userContent.css" />
	</head>
	<body>	
	' > /tmp/markdown.html

	markdown $1 >> /tmp/markdown.html
	echo '</body>'  >> /tmp/markdown.html
	echo '</html>'  >> /tmp/markdown.html

	firefox /tmp/markdown.html &
