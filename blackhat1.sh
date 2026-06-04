GNU bash, versión 5.3.9(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2025 Free Software Foundation, Inc.
Licencia GPLv3+: GPL de GNU versión 3 o posterior <http://gnu.org/licenses/gpl.html>

Esto es software libre, es libre para modificar y redistribuirlo.
No hay NINGUNA GARANTÍA, a la extensión permitida por la ley.

#  Environment variables are dynamic-named values maintained by the shell 
#  that define system context, user identity, and runtime behaviors.
#
#  1. Shell Path Location Context:
#     - Command: echo ${SHELL}
#     - Logic: Returns the absolute path of the default login shell binary 
#       assigned to the current user descriptor (e.g., /usr/bin/zsh or /bin/bash).
#
#  2. Pseudo-Random Number Generation:
#     - Command: echo ${RANDOM}
#     - Logic: An internal shell function (not a static variable) that returns 
#       a signed 16-bit pseudo-random integer ranging dynamically from 0 to 32767.
#
#  3. Numerical Identity Validation:
#     - Command: echo ${UID}
#     - Logic: Expands to the numerical User ID of the current session owner. 
#       * Root context translates strictly to: 0.
#
#  4. Operating System Architecture Target:
#     - Command: echo ${OSTYPE}
#     - Logic: Automatically populates a string describing the operating system 
#       flavor on which the shell binary was compiled (e.g., linux-gnu).