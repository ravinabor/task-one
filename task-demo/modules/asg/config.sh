#!/bin/bash


# #!/bin/bash
# apt update -y        # Update each package already installed
# apt install -y httpd # Install pache
#     service httpd start  # Start apache
#     chkconfig httpd on   # Start apache whenever the VM starts up
#     echo "My web server configured with Terraform! $(hostname -f)" > /var/www/html/index.html
     

     
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y openjdk-11-jdk
sudo apt-get install git -y
sudo apt-get install -y mysql-server
sudo systemctl enable mysql
cd /mnt/
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip
sudo apt-get install unzip -y
unzip apache-maven-3.9.6-bin.zip
sudo unzip *.zip
cd /home/ubuntu
echo "export MAVEN_HOME=/mnt/apache-maven-3.9.6" >> .bashrc
echo "export M2_HOME=/mnt/apache-maven-3.9.6" >> .bashrc
echo "export M2=/mnt/apache-maven-3.9.6/bin" >> .bashrc
echo "export PATH=/mnt/apache-maven-3.9.6/bin:$PATH" >> .bashrc
sudo init 6
cd /mnt/
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.zip
unzip apache-tomcat-9.0.86.zip
sudo rm -rf *.zip
sudo chmod -R 777 apache-tomcat-9.0.86/
cd apache-tomcat-9.0.86/
cd bin/
./startup.sh
cd /mnt/
sudo git clone https://github.com/Shantanumajan6/project.git
sudo chmod -R 777 project/
cd project
mvn clean install
cd target/
sudo cp LoginWebApp.war /mnt/apache-tomcat-9.0.86/webapps/
cd /mnt/apache-tomcat-9.0.86/
    