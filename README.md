# DevOps:  
## DevOps;
* Why do we need devops?  
  ***Prevent the "wall team"***  
  ***Cloud deployment reduces costs and make projects scalable***  
  ***Promotes colaberation culture***  
  ***Helps superior product creation in less time***  


*  Monolith vs N-tier vs Microservices:  
  ***Monolith - One single program in one location usefull for small programs***  
  ***N-tier - Front end is seperated from the backend and db completely***  
  ***Microservices - All aspects are seperated from all other aspects***  


* Waterfall vs Agile:  
  ***Waterfall - Simple but non-adaptable if things dont go perfectly you will have serious problems at the end***  
  ***Agile - Iterative and flexible, responds to change and creates more robust products***  


* Four pillars of DevOps:  
  1. ***Ease of Use***  
  2. ***Flexibility***  
  3. ***Robustness***  
  4. ***Cost***  


## Vagrant:  
* `vargrant up` - start
* `vargrant destroy` - delete
* `vagrant status` - status of machines
* `vagrant ssh` - access the machines
* `vagrant halt` - stop  


## Linux:  
* `apt install` - Package manager
* `mkdir` - Make folder  
* `ls` - list files  
* `nano` - text editor  
* `touch` - makefile  
* `cd` .. - up a dir  
* `pwd`  - print working directory
* `mv` - move also used to rename  
* `cp` - copy  
* `rm` - remove  
* `ll` - check permissions  


## nginx:  
  ***NGINX is open source software for web serving, reverse***  
  ***proxying, caching, load balancing, media streaming, and more.***  


## Attach an ip to your vm:  
1. In vagrant file specify the ip you want to use with:  
```
config.vm.network "private_network", ip: "192.168.10.100"
```  


## Use hostsupdater to assign an alias:  
1. In vagrant file specify the alias you want to use with:  
```
# WARNING may have to remove for initial up
config.hostsupdater.aliases = ["development.local"]
```  


## Automate the installation of dependencies:
1. Create an easily accessable `.sh` file with linux code in it eg:  
```
#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# nginx
sudo apt-get install nginx -y

# npm
sudo apt-get install npm -y

# node js
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# pm2
sudo npm install -g pm2
```  
2. In vagrantfile point your vm to it  
```
config.vm.provision "shell", path: "project/environment/provision.sh"
```  
3. These commands should now run on `vagrant up`  


## Define multiple VM's:  
1. Use `config.vm.define "vmname" do |vmname|`  
2. Then define your rules as usual but use `vnmane.vm.command` instead of `config.vm.command`  
3. Finally cap that code block with an `end`  
4. Example:  
```
config.vm.define "app" do |app|
    # Create a virtual machine ubuntu
    app.vm.box = "ubuntu/xenial64"


    # attach an IP
    app.vm.network "private_network", ip: "192.168.10.100"


    # WARNING create an alias to link the ip to a web address (may have to remove for initial up)
    app.hostsupdater.aliases = ["development.local"]


    # shared folder
    app.vm.synced_folder "project", "/home/vagrant/app"

    # run script 
    # config.vm.provision "shell", inline: $script
    app.vm.provision "shell", path: "project/environment/provision_app.sh"
end
```


# Setup Guide:
## Download and install Ruby:  
1. Install Ruby using this [guide](https://github.com/khanmaster/vb_vagrant_installtion/blob/master/Ruby_01/RUBY_INSTALLATION.md)  
2. Open an elevated command prompt and do `gem install bundler:2.2.9`  


## Download and install Vagrant:  
1. Install Vagrant using this [guide](https://github.com/khanmaster/vb_vagrant_installtion/blob/master/vagrant_02/VAGRANT_INSTALLATION.md)  
2. Open an elevated command prompt and do `vagrant plugin install vagrant-hostsupdater --plugin-version=1.0.2`  


## Download and install VirtualBox:  
1. Install VirtualBox using this [guide](https://github.com/khanmaster/vb_vagrant_installtion/blob/master/Virtual_box_03/VIRTUAL_BOX_INSTALLATION.md)  


## Setup this muti-machine environment:  
1. Clone this git repository into a folder of your choosing  
2. In the same directory as vagrant file do `vagrant up`, if this fails open vagrantfile and see the line marked `# WARNING`  
3. After this `vagrant status` should show a box called app and another called db  
4. `vagrant ssh name` will let you access them  
5. In the app vm do `cd app/app/` and then `sudo npm install`  
6. everything should now be fully functional  


## Run ruby dependency tests
1. In "/projects/tests" run `bundler`, this only has to be run one time ever  
2. In "/projects/tests" run `rake spec`
3. The output should indicate the success of the multimachine environment  


