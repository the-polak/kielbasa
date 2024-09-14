#!/bin/bash

#   HOWTO: 
#           chmod +x kielbasa-apps.sh
#           sudo ./kielbasa-apps.sh


# Fedora Update
echo "Updating OS...."
sudo dnf update --refresh
sudo dnf upgrade -y

# Automagically Adding Flatpak Repo
echo "Ensuring Flathub Repo is added..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Update Flatpak repositories
echo "Updating Flatpak repositories..."
flatpak update

# Install Nextcloud Desktop
echo "Installing Nextcloud Desktop..."
flatpak install -y flathub com.nextcloud.desktopclient.nextcloud

# Install Obsidian
echo "Installing Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian

# Install Vivaldi Browser
echo "Installing Vivaldi Browser..."
flatpak install -y flathub com.vivaldi.Vivaldi

# Install Visual Studio Code (VS Code)
echo "Installing Visual Studio Code..."
flatpak install -y flathub com.visualstudio.code

# Install VLC Media Player
echo "Installing VLC Media Player..."
flatpak install flathub org.videolan.VLC

# Install OnlyOffice
echo "Installing OnlyOffice...."
flatpak install flathub org.onlyoffice.desktopeditors

# Install LocalSend
echo "Installing LocalSend..."
flatpak install flathub org.localsend.localsend_app

# Install Mullvad Browser
echo "Installing Mullvad Browser"
flatpak install flathub net.mullvad.MullvadBrowser   

# Tailscale - https://tailscale.com/kb/1050/install-fedora
echo "Add Tailscale Repo & install Tailscale"
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up
tailscale ip -4

# KTailctl - https://github.com/f-koehler/KTailctl
echo "Installing KTailctl..."
flatpak install flathub org.fkoehler.KTailctl

# Completion message
echo "Installation of Nextcloud, Obsidian, Vivaldi, Visual Studio Code, 
VLC, OnlyOffice, Master PDF Editor, Mullvad Browser and Tailscale is complete!"