# MacOS Post-Install

Common post install activities.

## **MacOS Post-Install**

 creating a `.md` of common post-install activities. Created new Obsidian doc: `MacOS Post Install.md`

- Uploading to public github via Visual Studio Code

## **Clear MacOS Dock**

- `dockutil` can accomplish this task. However, a standalone app is not required.
- <https://apple.stackexchange.com/questions/340348/remove-macos-dock-icon-with-a-command-in-terminal>

```bash
# Remove icons from Dock
defaults write com.apple.dock persistent-apps -array
# Restart Dock
defaults delete com.apple.dock; killall Dock
```

## **Install Homebrew**

- <https://brew.sh>

```bash
# Install HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo reboot

# Add to environment
echo >> /Users/USER DIRECTORY/.zprofile
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> /Users/USER DIRECTORY/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

## **Brew Apps**

### Obsidian

```bash
brew install --cask obsidian
```

### Visual Studio Code

```bash
brew install --cask visual-studio-code
```

### Nextcloud Desktop

```bash
brew install --cask nextcloud
```

### iTerm

```bash
brew install --cask iterm2
```

## <u>Non-Brew Apps</u>

### [Brave](https://brave.com/download-nightly/) Browser `.dmg`

```bash
I prefer Nightly. Bleeding edge features and relatively stable.
```

Direct dl

- <https://laptop-updates.brave.com/latest/osx/nightly?bitness=64>


## Terminal Customizations

### Oh My ZSH

- <https://ohmyz.sh/#install>
  - <https://github.com/ohmyzsh/ohmyzsh/wiki>

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

#### Theme: Powerlevel10k
>
> I default to the some-what abandoned powerlevel10k. Not sure why but running the config tool does not install Nerd Fonts. 
- https://github.com/romkatv/powerlevel10k

1. Install and Apply Meslo Nerd [Fonts](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#fonts)
2. Install #powerlevel10k

```bash
# Clone repo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Apply theme
Open `~/.zshrc`, find the line that sets `ZSH_THEME`, and change its value to `"powerlevel10k/powerlevel10k"`
```

3. Run the config tool

```bash
p10k configure
```
