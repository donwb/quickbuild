This is a short shell script that will get Node up and running with the latest version of Node oe Legacy Node and Redis on Ubuntu.  It installs several packages that are required for compiling bcrypt(node module for encryption) as well.  It also contains an example upstart file.  The goal of the script is to shorten the amount of time it takes for you to get a Ubuntu VM up and running.  I think it now takes me about 10 minutes to get from dashboard creation of the vm in azure to a running node application(most of the time waiting for the VM to be allocated). 

The first step to execute this script is to ssh onto your new VM and install git(sudo apt-get install git) then clone this repository. 

Once cloned, cd to quickbuild and run ./buildvm.sh.  You can pass -l to get the latest version of node and -r to install redis.  If for some reason it fails to run, you may need to type: chmod 700 buildvm.sh  to allow the script to be executed.  Once running, it will ask you for your sudo password(the one you logged in with).  This is needed to install the apt-get packages.

The script will then echo to stdout what is occurring and then it concatentates all the behind the scenes stuff to a log file as it's running.  

This also sets the VM's time to EST and sets the number of open files to 10000.  
