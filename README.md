# Guión de instalación de Awesome WM usando scripts

	En formación...

# Guión manual de instalación
Instalación base de Awesome WM

  	mkdir -p ~/.config/awesome/
	cp /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua

Configuración de .xinitrc

	echo "exec awesome" >> ~/.xinitrc

Configuración del tema

	mkdir .config/themes
	cp /usr/share/awesome/themes* .config/awesome/themes
	
