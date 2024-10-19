#!/bin/bash

: '
             chmod a+x neon-post.sh
             sudo ./neon-post.sh
'
# KDE Neon Edition

# refresh and update
echo "updating KDE Neon"
sudo pkcon refresh && sudo pkcon update

# Non-flatpak Apps


# Automagically Adding Flatpak Repo
echo "Ensuring Flathub Repo is added..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Update Flatpak repositories
echo "Updating Flatpak repositories..."
flatpak update

# Install Nextcloud Desktop - https://github.com/nextcloud/desktop
echo "Installing Nextcloud Desktop..."
flatpak install -y flathub com.nextcloud.desktopclient.nextcloud

# Install Obsidian - https://github.com/obsidianmd/obsidian-releases
echo "Installing Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian

# Install Vivaldi Browser - https://github.com/flathub/com.vivaldi.Vivaldi
echo "Installing Vivaldi Browser..."
flatpak install -y flathub com.vivaldi.Vivaldi

# Install Visual Studio Code (VS Code) - https://github.com/microsoft/vscode-docs
echo "Installing Visual Studio Code..."
flatpak install -y flathub com.visualstudio.code

# Install VLC Media Player - https://github.com/videolan/vlc
echo "Installing VLC Media Player..."
flatpak install -y flathub org.videolan.VLC

# Install OnlyOffice
echo "Installing OnlyOffice...."
flatpak install -y flathub org.onlyoffice.desktopeditors

# Install LocalSend - https://github.com/localsend/localsend
echo "Installing LocalSend..."
flatpak install -y flathub org.localsend.localsend_app

# Install Mullvad Browser - https://github.com/mullvad/mullvad-browser
echo "Installing Mullvad Browser"
flatpak install -y flathub net.mullvad.MullvadBrowser

echo
echo

echo "Post-installation script completed!"
