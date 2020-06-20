#!/bin/bash

should_remove_previous_version() {
  if [[ $(terraform -version) ]]; then
    echo "Removing previous terraform..."
    sudo rm /bin/terraform
  fi
}

should_remove_previous_version
echo "Downloading Terraform..."
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
echo "Unziping..."
unzip terraform_0.12.26_linux_amd64.zip
echo "Moving to /bin"
mv terraform /bin
echo "Cleaning files.."
rm terraform_0.12.26_linux_amd64.zip
echo "All done!"
terraform -version
