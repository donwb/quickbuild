This is a short shell script that will get Node up and running with the latest version of Node and Redis on Ubuntu 12.04.  It installs several packages that are required for compiling bcrypt(node module for encryption).  It also sets up upstart for you(with a little editting).  The goal of the script is shorten the amount of time it takes for us to get a Ubuntu VM up and running.  I think it now takes me about 10 minutes to get from dashboard creation of the vm in azure to a running node application. 

The first step to execute this script is to ssh onto your new VM and install git(sudo apt-get install git) then clone this repository. 

Once cloned, run ./buildvm.sh.  If for some reason it fails to run, you may need to type: chmod 700 buildvm.sh  to allow the script to be executed.  

The script echo's to stdout what is occurring and then concatentates all the behind the scenes stuff to a log file.  

Rememeber to follow the steps at the end of the script to get everything up and running.