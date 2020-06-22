#!/bin/bash

TERRAFORM=/usr/local/bin/terraform

remove_previous_version()
{
    if test -f "$TERRAFORM"; then
        echo "Removing previous version..."
        sudo rm "$TERRAFORM"
    fi
}

remove_previous_version
echo "Downloading Terraform..."
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
echo "Unziping..."
unzip terraform_0.12.26_linux_amd64.zip
echo "Moving to /usr/local/bin"
sudo mv terraform /usr/local/bin
echo "Cleaning files.."
rm terraform_0.12.26_linux_amd64.zip
echo "All done!"
terraform -version
