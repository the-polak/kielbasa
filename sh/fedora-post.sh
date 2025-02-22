#!/bin/bash

: '
     HOWTO:
Fedora 41 Post-Install

chmod a+x fedora-post.sh
sudo ./fedora-post.sh
'

# Log all output for debugging purposes
LOGFILE="fedora-post-install.log"
exec > >(tee -i $LOGFILE) 2>&1

echo "Starting Fedora post-install script..."

# Update and upgrade the system
echo "Updating OS..."
sudo dnf update --refresh -y
sudo dnf upgrade -y

# Install essential packages
echo "Installing essential packages..."
sudo dnf install -y git wget curl htop fastfetch

# Enable RPM Fusion repositories (Free and Non-Free)
echo "Enabling RPM Fusion repositories..."
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install multimedia codecs (optional)
echo "Installing multimedia codecs..."
sudo dnf groupinstall -y multimedia

# Install Development Tools (optional)
echo "Installing development tools..."
sudo dnf groupinstall -y "Development Tools" "Development Libraries"

# Set up Fastfetch to run when opening the terminal
echo "Setting up Fastfetch on terminal startup..."
echo "fastfetch" >> ~/.bashrc

# Add Flathub repository
echo "Ensuring Flathub Repo is added..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Update Flatpak repositories
echo "Updating Flatpak repositories..."
flatpak update -y

# Install Flatpak applications
FLATPAK_APPS=(
    com.nextcloud.desktopclient.nextcloud
    md.obsidian.Obsidian
    com.vivaldi.Vivaldi
    com.visualstudio.code
    org.videolan.VLC
    org.onlyoffice.desktopeditors
    org.localsend.localsend_app
    net.mullvad.MullvadBrowser
)

echo "Installing Flatpak applications..."
for APP in "${FLATPAK_APPS[@]}"; do
    echo "Installing $APP..."
    flatpak install -y flathub "$APP"
done

# Clean up the system
echo "Cleaning up system..."
sudo dnf autoremove -y
sudo dnf clean all

echo "Post-installation script completed! Logs are saved in $LOGFILE."
