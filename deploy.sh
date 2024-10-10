#!/bin/sh
echo "updating hosts file avoid github 404..."
sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts
cp ./vim/.vimrc ~/
cp ./git/.gitconfig ~/
