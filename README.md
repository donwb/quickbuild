buildvm.sh

This is a short shell script that will get Node up and running with the latest version of Node oe Legacy Node and Redis on Ubuntu.  It installs several packages that are required for compiling bcrypt(node module for encryption) as well.  It also contains an example upstart file.  The goal of the script is to shorten the amount of time it takes for you to get a Ubuntu VM up and running.  I think it now takes me about 10 minutes to get from dashboard creation of the vm in azure to a running node application(most of the time waiting for the VM to be allocated). 

The first step to execute this script is to ssh onto your new VM and install git(sudo apt-get install git) then clone this repository. 

Once cloned, cd to quickbuild and run ./buildvm.sh.  You can pass -l to get the latest version of node and -r to install redis.  If for some reason it fails to run, you may need to type: chmod 700 buildvm.sh  to allow the script to be executed.  Once running, it will ask you for your sudo password(the one you logged in with).  This is needed to install the apt-get packages.

The script will then echo to stdout what is occurring and then it concatentates all the behind the scenes stuff to a log file as it's running.  

This also sets the VM's time to EST and sets the number of open files to 10000.  

ubuntu-nqa.seed

This is a seed file for ubuntu 12.04 to allow you to do an unattended setup.  There are numerous items that can be tweeked but the most important things are obviously the user and password info:  root's password is root and ubuntu's password is ubuntu.  You'll most definitely want to change these if you provision this out to the cloud with packer.io but if you are using the next file listed the root password will need to be synced up.

basic_node_box.json

This is a packer.io configuration file.  If you don't know what packer.io is, you can check it out here: http://www.packer.io .  This file when executed with packer will create a virtualbox appliance(including guest additions).  To create this it does 3 basic things: 1. It will pull down the 64 bit Ubuntu Server 12.04 iso from a mirror site.  2. Run an unattended setup using the above seed file(you have to host it somewhere). 3. Install git, pull down the buildvm.sh file above and run it.  Once all the steps are complete, you can import the ubuntu appliance into virtualbox and have an image that is pretty much identical to what we have out in EC2. 

basic_node_do.json

This is a packer.io configuration file.  If you don't know what packer.io is, you can check it out here: http://www.packer.io .  This file when executed with packer will create a digital ocean image(which has all the stuff needed for node) that you can use to create a droplet.  The image is created using the above buildvm.sh file.  Once packer has completed creating the image, you can create a droplet using that image.
