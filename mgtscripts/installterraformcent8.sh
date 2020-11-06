#!/bin/bash
sudo dnf -y install wget unzip

tf_ver=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest |  grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`

wget https://releases.hashicorp.com/terraform/${tf_ver}/terraform_${tf_ver}_linux_amd64.zip

unzip terraform_${tf_ver}_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform version
