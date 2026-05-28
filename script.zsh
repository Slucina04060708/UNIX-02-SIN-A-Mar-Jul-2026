# Watch the actual principal group
id
id -gn # Only the nome of the principal group
# Create a file and see which group is inhereted 
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
# The group is the principal group of the user

# Watch the actual group
id -gn
echo "Grupo actual: $(id -gn)"

#Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

#change to the group 'desarrolladores'
newgrp desarrolladores
#Verify that the active group change

id -gn
echo "Nuevo grupo activo: $(id -gn)

#Create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# Now the group is 'desarrolladores'
#Create a directory
mkdir -p ~/proyectos_dev/src
ls =la ~/

#proyecto_dev/ has 'desarrolladores' group
#Exit the subshel of newgrp
exit
#Verify tha we come back to the originla group
id -gn
ech0 "Grupo restaurado: $(id -gn)"

#compare both files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt

#Create a group with password
sudo groupadd grupo_resringido
sudo gpasswd grupo_restringido
#The system will ask for a password for the group

# A user who does NOT belong to the group can join temporarily if they know the password
newgrp restricted_group
# The system will prompt for the group password
# If the password is correct, they join temporarily
id -gn
exit # Upon exiting, they lose the temporary membership