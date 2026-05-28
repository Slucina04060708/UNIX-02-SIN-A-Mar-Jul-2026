# See the actual principal group
id
id -gn # Only the nome of the principal group
# Create a file and see which group is inhereted 
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
# The group is the principal group of the user