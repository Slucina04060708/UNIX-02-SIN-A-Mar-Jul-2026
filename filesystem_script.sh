cd # (change directory)
cd /dev # Entras al directorio de dispositivos. 
ls # Lista el contenido del directorio actual.
tty # Terminales a las que me puedo conectar
ttys # Puertos seriales, interfaz física de comunicación que transmite datos de forma secuencial, bit a bit, a través de un solo hilo o par de hilos.
sd (solid disk) a;b;c.... #Particiones de disco
history #Muestra la lista numerada de todos los comandos que has ejecutado previamente en la sesión actual y las anteriores.
cat cpuinfo # Podemos visualizar información detallada sobre el procesador, incluyendo modelo, núcleos, velocidad y flags.
cd /proc #Cambia al directorio a proc el cual es un pseudo-sistema de archivos en memoria (RAM) que actúa como interfaz para las estructuras de datos del kernel, ofreciendo información detallada sobre procesos en ejecución
/media/ #Es donde el sistema operativo hace accesibles los archivos de unidades externas al conectarlas.
bin/ # ejecutbales escenciales (ls, cp, mv) binarios
etc/ #archivos de configuracion del sistema
home/ #directorios personales de usuario
var # datos raibales como los logs y los de BDD
gcc saludo.c -o saludobin #Creo un archivo nuevo en binario con el contenido de saludo.c 
sudo mv saludobin /bin/ # Mueve el contenido de saludobin al archivo /bin/
inodo #identificado unico
#El nombre del archivo no se guarda en el inodo sino en el directorio que lo contiene 
pwd #((Print Working Directory) en Linux muestra la ruta absoluta del directorio actual en la terminal
ls -F # Lista el contenido del directorio añadiendo un carácter indicador al final de cada nombre para identificar su tipo
/ #directorio
* #archivo
@ #enlace simbólico
cd / #Cambia el directorio actual al directorio raíz (Root), que es el nivel más alto de la jerarquía del sistema de archivos en Linux/Unix.
ls -i #Muestra los inodos
Hard link #Crea un segundo nombre para el mismo inodo
# Si borras el nombre original el archivo sigue existiendo siempre y cuando permanezca un hard link
Soft link #Es un puntero (como acceso directo en windows) al nombre de otro archivo
#Si borrs el original, el enlace simbólico se rompe.
bin #Comandos como usuario general
sbin #Comandos como administrador