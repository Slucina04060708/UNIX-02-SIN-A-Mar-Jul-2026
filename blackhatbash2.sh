#!/bin/bash
#set -x
#All this script does is create a directory, create a file within that directory, and then list the contents of the directory in long format.
mkdir mydirectory
touch mydirectory/myfile
ls -l mydirectory