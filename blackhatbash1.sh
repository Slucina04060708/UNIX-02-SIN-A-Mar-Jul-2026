#!/bin/bash
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}
env
#GNU bash, versión 5.3.9(1)-release (x86_64-pc-linux-gnu)
#Copyright (C) 2025 Free Software Foundation, Inc.
#Licencia GPLv3+: GPL de GNU versión 3 o posterior <http://gnu.org/licenses/gpl.html>

#Esto es software libre, es libre para modificar y redistribuirlo.
#No hay NINGUNA GARANTÍA, a la extensión permitida por la ley.

#  Environment variables are dynamic-named values maintained by the shell 
#  that define system context, user identity, and runtime behaviors.

#  1. Shell Path Location Context:
#       Command: echo ${SHELL}
#     - Logic: Returns the absolute path of the default login shell binary 
#       assigned to the current user descriptor (e.g., /usr/bin/zsh or /bin/bash).

#  2. Pseudo-Random Number Generation:
#     - Command: echo ${RANDOM}
#     - Logic: An internal shell function (not a static variable) that returns 
#       a signed 16-bit pseudo-random integer ranging dynamically from 0 to 32767.

#  3. Numerical Identity Validation:
#     - Command: echo ${UID}
#     - Logic: Expands to the numerical User ID of the current session owner. 
#       * Root context translates strictly to: 0.

#  4. Operating System Architecture Target:
#     - Command: echo ${OSTYPE}
#     - Logic: Automatically populates a string describing the operating system 
#       flavor on which the shell binary was compiled (e.g., linux-gnu).

#  The Shebang defines the interpreter execution layer, while runtime flags 
#  and environmental shell builtins control syntax auditing and execution tracing.

#  1. Interpreter Directives (Shebang Lines):
#     - #!/bin/bash : Hardcoded path targeting the primary system Bash binary.
#     - #!/usr/bin/env bash : Flexible path query. Uses 'env' to find the 
#       first Bash binary in the user's active $PATH. Highly portable.

#  2. Runtime Shell Invocation Flags:
#     - bash -r myscript.sh : Restricted Mode. Spawns a secure shell where 
#       commands like 'cd', path modifications, or redirection are disabled.
#     - bash -n myscript.sh : Read-Only Mode. Reads the script and checks for 
#       syntax errors without actually executing any commands (Dry Run).
#     - bash -x myscript.sh : Trace Mode. Prints every command to stdout 
#       expanded with variables before executing it. Vital for troubleshooting.

#  3. Internal Script Runtime Tracing (Fine-Grained Debugging):
#     - set -x : Activates tracing (debugging) dynamically from this line onward.
#     - set +x : Deactivates tracing, returning to silent execution.
#       * Logic: Allows isolating specific lines of complex code for audit.