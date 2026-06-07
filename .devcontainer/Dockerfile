# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.

# ============================================================================
# BLOCK a: Base Image Definition
# ============================================================================
# A base image is the foundational layer of a Dockerfile specified by the FROM 
# instruction, serving as the starting point to build a containerized environment 
# (GeeksforGeeks, 2026). In this course, we utilize "kalilinux/kali-rolling" 
# because it is a lightweight, Debian-based Linux distribution specialized for 
# cybersecurity, penetration testing, and ethical hacking (Arsys, n.d.). 
# Deploying Kali inside a Docker container provides a highly optimized and 
# secure lab environment to execute pentesting tools without altering our 
# host operating system, aligning with the lab infrastructure setup concepts 
# discussed in Black Hat Bash.

FROM kalilinux/kali-rolling:latest

# ============================================================================
# BLOCK b: Image, Layer, and Cache Architecture
# ============================================================================
# A Docker image is built as a stack of read-only layers, where each individual 
# instruction translates into a single filesystem layer (BHB Ch. 3). According 
# to Docker Documentation (Inc., 2024), Docker optimizes compilation using a 
# build cache. However, if a change is detected in any instruction, that specific 
# layer is invalidated. This triggers a cascade effect where all subsequent 
# downstream layers are forced to rebuild from scratch, even if their contents 
# did not change. To maximize performance and avoid rebuilding heavy dependencies 
# repeatedly, we place stable commands like ENV or system configurations at 
# the top and highly volatile elements toward the bottom.


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.

# ============================================================================
# BLOCK c: Environment Variables (ENV) Configuration
# ============================================================================
# The ENV instruction defines persistent environment variables available to the 
# shell and all processes inside the container, as discussed in Black Hat Bash 
# regarding system variables (BHB Ch. 1). 
# - DEBIAN_FRONTEND=noninteractive: Forces the package manager (apt-get) to 
#   install software completely unattended, suppressing interactive prompts or 
#   dialogues that would freeze the background Docker build process.
# - LANG & LC_ALL=es_ES.UTF-8: Sets the system localization to Spanish and 
#   configures UTF-8 character encoding, ensuring text streams (stdout/stderr) 
#   properly render special characters, accents, and symbols.
# - TERM=xterm-256color: Informs the terminal emulator to support a 256-color 
#   palette, which is essential for proper syntax highlighting in text editors 
#   and interactive command-line utilities.

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.

# ============================================================================
# BLOCK d: Automated Package Pre-Configuration (debconf)
# ============================================================================
# Certain network tools, like Wireshark and Tshark, launch interactive TUI 
# prompts during installation to ask if non-root users should be allowed to 
# capture packets. To maintain a completely unattended Docker build process 
# as emphasized in laboratory automation (BHB Ch. 3), we use a pipe (|) operator 
# to redirect standard output (stdout) from the echo command into the standard 
# input (stdin) of debconf-set-selections (BHB Ch. 1). By setting this to 
# "false", we restrict packet capturing privileges exclusively to the root 
# user for internal system security, while successfully preventing apt-get 
# from freezing the image compilation while waiting for manual user input.

RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections

# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).

# ============================================================================
# BLOCK e: Package Installation and Core Toolset
# ============================================================================
# This RUN instruction updates package lists and installs the core utilities.
# - 'apt-get update' synchronizes repository indexes, while 'install' deploys software.
# - The '-y' flag automates inputs by assuming 'yes' to space/install confirmation prompts.
# - '--no-install-recommends' skips optional packages, keeping the final layer lightweight.
# - Optimization: Bundling these tasks into ONE big RUN command prevents temporary installation 
#   cache data from being permanently saved in separate filesystem layers (Docker Cache).
# - Logic: The '&&' control operator chains commands execution only if the previous step 
#   succeeds with an exit code of 0, and trailing backslashes (\) escape newlines (BHB Ch. 1).
#
# Core Tools Functionality Overview:
# - build-essential, curl, wget, git, git-lfs, unzip: Foundational development tools 
#   used to fetch, decompress, and build source repositories (BHB Ch. 3).
# - gawk, sed, grep: Text processing and stream utilities used to filter and manipulate 
#   unstructured terminal outputs and files (BHB Ch. 2).
# - jq: A command-line JSON processor. According to Oracle (Erickson, 2024), JSON is a 
#   key-value text format widely used for data exchange. Since traditional text filters struggle 
#   with nested data structures, jq acts as a specialized stream filter to cleanly parse JSON APIs.
# - shellcheck: A static analysis utility that checks Bash script flows for syntax errors.
# - nmap, tcpdump, tshark: Crucial security scanning and packet sniffing utilities used 
#   to analyze network traffic within the virtual lab infrastructure (BHB Ch. 3).
# - tor, proxychains4: Anonymity tools used to route hacking traffic through secure proxy chains.
# - man-db, manpages-es: Core manuals database required to read UNIX system documentation pages.

RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.

# ============================================================================
# BLOCK f: Localization Configuration (Spanish Locale Deployment)
# ============================================================================
# This step enables and generates the system-wide Spanish language locale support.
# - 'sed -i' is utilized as an in-place stream editor (BHB Ch. 2) to search inside 
#   the '/etc/locale.gen' file, substituting the commented line '# es_ES.UTF-8 UTF-8' 
#   with its active equivalent 'es_ES.UTF-8 UTF-8'. This removes the '#' character.
# - 'locale-gen' is subsequently triggered to compile and build the actual language 
#   binary definitions from the newly updated configuration file, enabling full 
#   UTF-8 character rendering and regional formatting inside the terminal.

 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.

 # ============================================================================
# BLOCK g: Docker Layer Optimization and Cache Cleanup
# ============================================================================
# This final cleanup phase removes temporary package files to optimize the image size.
# - 'apt-get clean' clears downloaded package installers (.deb) from the local cache.
# - 'rm -rf /var/lib/apt/lists/*' recursively and forcefully deletes repository index lists.
# - Why in the SAME RUN? According to Docker Documentation (Inc., 2024), since every RUN 
#   instruction commits a permanent filesystem layer, these massive temporary files must 
#   be purged within the exact same step before the layer is saved. Doing this later in a 
#   separate RUN command would fail to reduce the image size, as the data would already 
#   be baked into an intermediate layer (BHB Ch. 3).

 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).

# ============================================================================
# BLOCK h: Explicit Shell Configuration (sh vs bash and the -c flag)
# ============================================================================
# By default, Docker executes subsequent RUN instructions using the minimal /bin/sh. 
# Specifying SHELL ["/bin/bash", "-c"] forces the builder to use Bash instead. 
# As detailed in Black Hat Bash (BHB Ch. 1), Bash introduces advanced syntax extensions 
# and modern scripting features absent in standard POSIX sh. Furthermore, according to 
# Ask Ubuntu documentation (Lan, 2020), the '-c' flag tells the shell to read and execute 
# the trailing string as a command rather than launching an interactive prompt, which 
# allows Docker to successfully pass complex multi-line automation blocks in the background.

SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Cambiar shell de login de root a zsh dentro de la imagen,
# para que chsh ya no haga falta y todo sea consistente.
RUN chsh -s /usr/bin/zsh root

# Prompt institucional para los y las estudiantes del curso
RUN cat >> /root/.zshrc <<'EOF'

# ===== Valida si un comando fue ejecutado correctamente =====
PROMPT='%F{cyan}[Santiago-Lucina]%f %F{yellow}%1~%f %(?.%F{green}✓.%F{red}✗ %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]


