uname -a #daba información del ordenador
which gpg #ubicación del binario de gpg
gpg --version #me da la versión e información adicional
gpg --full-generate-key #genero llave pública y privada
gpg --armor --export #exportar llave pública, armor expresa el binario forma legible
RSA #retrocompatiblidad 
4096 bits #suficientemente grande para seguridad pero suficientemnte pequeño para que computadoras puedan comprobar la contraseña
gpg --list-secret-keys --keyid-format=long #Listar llaves privadas
pull #proponer cambios
push #envío los cambios
gpg --armor --export-secret-keys XXXXXXXX #especificar el hash de llaves correspondientes
gpg --armor --export-secret-keys #exportar privada
gpg --armor --export slucina0406@gmail.com >mi_llave_pública.asc #exporto mi llave publica y la guardo en un archivo
 gpg --import PAULA tu_llave_pública.asc #Importo la llave publica de mi compañera y creo un nombre para esa llave
 echo "esta" >doc_no_cifrado.txt #echo "esta": Imprime la palabra "esta" en la terminal. >: Es un redireccionador. En lugar de mostrar el texto en pantalla, lo envía a un archivo. doc_no_cifrado.txt: Es el nombre del archivo que se creará (o se sobrescribirá si ya existe). 
gpg --output doc_cifrado.txt --encrypt --recipient xxxxxxxx doc_no_cifrado.txt #Usa GnuPG para cifrar el archivo doc_no_cifrado.txt mediante la clave del destinatario xxxxxxxx y guarda el resultado en doc_cifrado.txt.