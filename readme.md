Guión de instalación de Awesome WM usando scripts
=========

	En formación...

Guión manual de instalación
===========

Instalación base de Awesome WM

  	mkdir -p ~/.config/awesome/
	cp /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua

Configuración de .xinitrc

	echo "exec awesome" >> ~/.xinitrc

Configuración del tema

	mkdir .config/themes
	cp /usr/share/awesome/themes* .config/awesome/themes
	
Awesome WM (Español) en la Arch Wiki: https://wiki.archlinux.org/index.php/Awesome_(Espa%C3%B1ol)
