uname -a #daba información del ordenador
which gpg #ubicación del binario de gpg
gpg --version #me da la versión e información adicional
gpg --full-generate-key #genero llave pública y privada
gpg --armor --export #exportar llave pública, armor expresa el documento de forma legible
RSA #retrocompatiblidad 
4096 bits #suficientemente grande para seguridad pero suficientemnte pequeño para que computadoras puedan comprobar la contraseña
gpg --list-secret-keys --keyid-format=long #Listar llaves privadas