#!/bin/bash
#INSTALL -- SET LOCAL TIME
        cd
        mv /etc/localtime /etc/localtime.bak
	#change Asia/Jakarta with your timezone
        ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

#INSTALL -- YUM
        cd
        yum install wget gcc nano -y 
        
        #Update YUM
        yum update -y 
        
        #Upgrade YUM
        yum upgrade -y
        
        #Install WGet
        yum install wget -y 


#INSTALL -- NPM
        cd
        curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash && source ~/.bash_profile
        
        #Export NVM
        export NVM_DIR="/root/.nvm" [ -s "$NVM_DIR/nvm.sh" ] 
        
        #Install NVM
        nvm install 10.1.0
        
        #Use NVM
        nvm use 10.1.0 
        
        #Use As Default
        nvm use default
        
        #Set NVM Alias Default
        nvm alias default 10.1.0
        
#INSTALL -- VESTA CP
        cd
        curl -O http://vestacp.com/pub/vst-install.sh
        #Run Bash
        bash vst-install.sh

#INSTALL -- UPGRADE PHP
        cd
        #Install noarch repo
        yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
        
        #Install remirelease
        yum install http://rpms.remirepo.net/enterprise/remi-release-6.rpm
        
        #Install yum-utils
        yum install yum-utils
        
        #Install php
        yum-config-manager --enable remi-php72
        
        #install
        yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y
        
#INSTALL -- SSL FOR VESTA PANEL
        cd
        #Get veSSL.sh
        wget https://raw.githubusercontent.com/trixvivo/YUM-WGET-FFMPEG-NPM-VestaCP/master/vcSSL.sh  

#INSTALL -- FFMPEG
        cd
        https://raw.githubusercontent.com/trixvivo/YUM-WGET-FFMPEG-NPM-VestaCP/master/ffmpeg.sh
        bash ffmpeg.sh

#CLEAR -- ALL Files
        cd
        rm -rf vst-install.sh
        rm -rf ffmpeg.sh

        

