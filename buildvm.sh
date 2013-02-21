echo "Copying upstart template"
sudo cp node-upstart.conf /etc/init >> log

echo "Copying latest stable node ppa and latest stable redis ppa"
sudo cp *.list /etc/apt/sources.list.d >> log

echo "Update aptitude with ppa's added above."
sudo apt-get update >> log

echo "Upgrading Ubuntu to the latest of everything."
sudo apt-get -u upgrade >> log

echo "Installing make. Needed for many native modules."
sudo apt-get install -y --force-yes make >> log

echo "Installing g++. Needed for many native modules."
sudo apt-get install -y --force-yes g++ >> log

echo "Installing node."
sudo apt-get install -y --force-yes nodejs >> log

echo "Installing npm."
sudo apt-get install -y --force-yes npm >> log

echo "Installing node-gyp."
sudo npm install -g node-gyp >> log

echo "Outputting node version."
node –v >> log

echo "Installing redis."
sudo apt-get install -y --force-yes redis-server >> log

echo "Testing connectivity to redis."
redis-cli PING >> log

echo "Setting timezone file to New York.(EST)"
echo "America/New_York" | sudo tee /etc/timezone

echo "Reconfiguring tzdata to use changed timezone file."
sudo dpkg-reconfigure --frontend noninteractive tzdata

echo "Change directory to home directory"
cd

echo "Make directory projects"
mkdir projects

echo "Remember to do the following to easily get this working:"

echo "1. Make sure you opened the http port on your azure dashboard."

echo "2. Git clone your repository into /home/azureuser/projects/."

echo "3. Run npm install on your node app."

echo "4. Run sudo vi /etc/init/node-upstart.conf and edit <yourappname>."

echo "5. Type sudo start node-upstart to start node server"

echo "6. cat /var/log/node-upstart.log to view console statements"

echo "7. surf to azure url and verify site is up and running"

