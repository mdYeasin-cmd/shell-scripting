#!/bin/bash

# Identify the User
USER_NAME=$(whoami)
ASSIGNED_SHELL=$(grep "^$USER_NAME:" /etc/passwd | cut -d: -f7)
CURRENT_SHELL_PATH=$(which $ASSIGNED_SHELL)

# Identify OS Version
OS_NAME=$(grep "^NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')
OS_VERSION=$(grep "^VERSION=" /etc/os-release | cut -d= -f2 | tr -d '"')

# Save Information in a File
sudo cat <<EOF > UserInfo.txt
User name               : $USER_NAME
Shell name              : $ASSIGNED_SHELL
Shell executable path   : $CURRENT_SHELL_PATH
OS name                 : $OS_NAME
OS version              : $OS_VERSION
EOF

echo "UserInfo.txt file is created."

# List Files
HOME_DIR=$(eval echo "~$USER_NAME")

sudo ls -la "$HOME_DIR" > UserHomeFileList.txt

echo "UserHomeFileList.txt file is created."

sudo ls -la /var/log > log.txt

echo "log.txt file is created."

# Create a Directory
sudo mkdir /opt/example_dir

# Create Soft Links
sudo ln -s "$(pwd)/UserInfo.txt" /opt/example_dir/UserInfo.txt
sudo ln -s "$(pwd)/UserHomeFileList.txt" /opt/example_dir/UserHomeFileList.txt
sudo ln -s "$(pwd)/log.txt" /opt/example_dir/log.txt

echo "Soft links are created in /opt/example_dir."

# Install NGINX
sudo apt update -y 
sudo apt install nginx -y

# Identify the Private IP Address
PRIVATE_IP=$(hostname -I | awk '{print $1}')

# Configure NGINX
NGINX_CONF="/etc/nginx/sites-available/default"

current_line="^([[:space:]]*)server_name _;"
expected_line="\1server_name $PRIVATE_IP;"

sudo sed -i -E "s/$current_line/$expected_line/" "$NGINX_CONF"

echo "NGINX server_name updated."

# Modify NGINX Default Page
sudo cp UserInfo.txt /var/www/html/index.nginx-debian.html

# Enable and Restart NGINX
sudo systemctl enable nginx
sudo systemctl restart nginx