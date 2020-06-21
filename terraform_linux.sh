#!/bin/bash

TERRAFORM=/bin/terraform

remove_previous_version()
{
    if test -f "$TERRAFORM"; then
        echo "Removing previous version..."
        sudo rm "$TERRAFORM"
    fi
}

has_unzip_package()
{
    unzip -version
    if [ $? -eq 0] ; then
        echo "Unzip package already exist..."
    else
        apt-get update
        apt-get install unzip
    fi
}

remove_previous_version
echo "Downloading Terraform..."
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
echo "Unziping..."
has_unzip_package
unzip terraform_0.12.26_linux_amd64.zip
echo "Moving to /bin"
sudo mv terraform /bin
echo "Cleaning files.."
rm terraform_0.12.26_linux_amd64.zip
echo "All done!"
terraform -version
