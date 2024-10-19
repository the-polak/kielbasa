  #!/bin/bash

  #   HOWTO: 
  #           chmod a+x fedora-post.sh
  #           sudo ./fedora-post.sh
  #
  #           My first Bash script. 

: '
             chmod a+x fedora-post.sh
             sudo ./fedora-post.sh

'

  # Fedora Update
  echo "Updating OS...."
  sudo dnf update --refresh
  sudo dnf upgrade -y

  # Install essential packages
  echo "Installing essential packages..."
  sudo dnf install -y git wget curl htop neofetch

  # Enable RPM Fusion (Free and Non-Free)
  echo "Enabling RPM Fusion repositories..."
  sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

  # Install multimedia codecs (optional)
  echo "Installing multimedia codecs..."
  sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
  sudo dnf groupupdate -y sound-and-video

  # Install Development Tools (optional)
  echo "Installing development tools..."
  sudo dnf groupinstall -y "Development Tools" "Development Libraries"

  # Set up Neofetch to run on login (optional)
  echo "Setting up Neofetch on login..."
  echo "neofetch" >> ~/.bashrc

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

  # Tailscale - https://tailscale.com/kb/1050/install-fedora
  echo "Add Tailscale Repo & install Tailscale"
  sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
  sudo dnf install tailscale
  sudo systemctl enable --now tailscaled
  sudo tailscale up
  tailscale ip -4

  # KTailctl - https://github.com/f-koehler/KTailctl
  echo "Installing KTailctl..."
  flatpak install -y flathub org.fkoehler.KTailctl

  echo

  # Run KTailctl
  # echo "Starting KTailctl..."
  # flatpak run org.fkoehler.KTailctl

  echo
  echo

  # Clean up system
  echo "Cleaning up..."
  sudo dnf autoremove -y
  sudo dnf clean all

  echo
  echo

  echo "Post-installation script completed!"