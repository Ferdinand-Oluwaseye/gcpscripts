#in tall dependencies
 sudo apt install -y wget vim python

 #creating a user
 getent passwd clouduser > /dev/null

 if [ $? -eq 0 ]; then
 	echo "User exists"
else
	sudo useradd --create-home clouduser
#	sudo usermod --shell /bin/bash clouduser
fi

	#Enter user environment

	sudo su - clouduser -c "mkdir -p  public"
	
	sudo apt install curl

	cd /home/clouduser/public

	#install node and npm
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs


	#clone repositories
	git clone -b Developer https://github.com/DimitriosKan/TeamB_Pool_Project_API.git
	
	git clone https://github.com/Ferdinand-Oluwaseye/gcpscripts.git 

	cd public/TeamB_Pool_Project_API

	sudo npm install

	sudo npm install express --save
	sudo npm install mongoose --save



	sudo chown -R clouduser:clouduser /home/clouduser

	#Writing service file

	sudo cp public/gcpscripts/myproj.service /etc/systemd/system/myproj.service

	#Load service
	sudo systemctl daemon-reload

	#Start python  service
	sudo systemctl start myproj

