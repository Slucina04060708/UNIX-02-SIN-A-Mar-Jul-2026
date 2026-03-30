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

gpg --output doc_cifrado.txt --encrypt --recipient xxxxxxxx doc_no_cifrado.txt #Usa GnuPG para cifrar el archivo doc_no_cifrado.txt mediante la clave del destinatario xxxxxxxx y guarda el resultado en doc_cifrado.txt.
gpg --decrypt PAULA_doc_cifrado.txt # desencripta el archivo de mi compañera y asi puedo ver el mensaje (decrypt correction)

gpg --decrypt PAULA_doc_cifrado.txt # desencripta el archivo de mi compañera y asi puedo ver el mensaje
web of trust #sistema distribuido, no cnetralizado en una compañia, yo decido a quien darle la confianza para certificar otras claves
# 1 Prefiero no decirlo
# 2 No tengo confianza
# 3 Confio un poco (marginal)
# 4 Confio totalmente (full) 
# Web of Trust: Se asigna nivel de confianza 4 (Full Trust) a la llave de Paula.
# Se elige este nivel porque se ha verificado personalmente su identidad y la 
# autenticidad de su huella digital (fingerprint) durante la sesión de laboratorio.
# 5 Confio Absolutamente (propias claves)
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt # Crea una firma digital en texto claro sobre doc_no_cifrado.txt, permitiendo que el contenido sea legible pero garantizando su autenticidad e integridad en el archivo de salida.

(clearsign)

cat doc_no_cifrado_firmado.txt #muestra en la pantalla todo el contenido del archivo que acabo de firmar.
# # Superusuario
# $ usuario general

gpg --verify PAULA_doc_no_cifrado_firmado.txt #Comprueba que el contenido del archivo no ha sido alterado y que la firma es auténtica.
gpg --edit-key XXXXX #Modifica, gestiona o examinar los detalles de una clave GPG específica.
gpg --sign -key XXXXXX #Valida oficialmente la identidad del dueño de una clave pública al estampar tu propia firma digital sobre ella.
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #Genera un archivo binario comprimido que contiene el mensaje original y su firma digital, haciendo que el contenido no sea legible sin usar GPG.
gpg --verify PAULA_doc_no_cifrado_firmado_binario.txt #Comprueba la integridad y autoría del archivo binario para confirmar que el contenido no fue alterado y que la firma es auténtica.
gpg --output firma_separada_doc_no_cifrado-sig --detach-sign doc_no_cifrado.txt #Crea un archivo de firma digital independiente que contiene solo la firma de doc_no_cifrado.txt, dejando el mensaje original sin cambios y por separado.
gpg --verify PAULA_firma_separada_doc_no_cifrado.sig PAULA_doc_no_cifrado.txt #Compara el archivo de la firma separada con el documento original para confirmar que el texto no ha sido modificado y que Paula realmente lo firmó.
gpg --output doc_cifrado_y_firmado.txt --encrypt --sign --recipient XXXXXX doc_no_cifrado.txt #Cifra y firma simultáneamente el archivo doc_no_cifrado.txt para que solo el destinatario pueda leerlo y confirme la identidad del autor original.
gpg --output doc_cifrado_y_firmado_descifrado_y_validado.txt --decrypt PAULA_doc_cifrado_y_firmado.txt #Descifra el contenido y verifica la firma de Paula simultáneamente, guardando el mensaje original limpio en el nuevo archivo de texto.
cat doc_cifrado_y_firmado_descifrado_y_validado.txt #Muestra en pantalla el contenido final del mensaje ya descifrado y verificado para confirmar que el texto es legible y correcto.
