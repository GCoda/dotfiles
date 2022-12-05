# `./setup.sh`

`./setup.sh` will extract all `bash #x` blocks from `README.md` and pipe them to bash...

## Create Edge profile .desktop links

- `Default` named **Edge Personal**
- `Profile 1` named **Edge Work**

```bash #x
mkdir -p ~/.local/share/applications/
cp ./application-launchers/* ~/.local/share/applications/
```

## Git config defaults 

copy name and email from latest commit of this repo

```bash #x
git config --global user.email "$(git log -1 --pretty=format:'%ae')"
git config --global user.name "$(git log -1 --pretty=format:'%an')"
git config --global init.defaultBranch main
```

## Alternatively we can use single `.desktop` file  with custom actions
```ini
[Desktop Action new-private-window]
Name=First Profile after Default
Exec=/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/edge com.microsoft.Edge --profile-directory="CUSTOM PROFILE DIR
```
## Custom ENV variables

Adds flatpak binaries and custom scripts to `PATH`

```bash #x
mkdir -p ~/.config/environment.d
cp ./dotfiles/environment.d/* ~/.config/environment.d
```

Copy custom binaries 

```bash #x
mkdir -p ~/.local/bin
cp ./dotfiles/bin/* ~/.local/bin
```

Copy dotfiles assumes `gnome-console` and `micro`

>   pacman -S micro 
>   pacman -S zoxide
>   pacman -S fnm


```bash #x

mkdir -p $HOME/.fzf/{shell,bin}

touch $HOME/.fzf/shell/key-bindings.bash
touch $HOME/.fzf/shell/key-bindings.zsh

mkdir -p ~/.config/fish

cp ./dotfiles/.bashrc ~/.bashrc
cp ./dotfiles/.zshrc ~/.zshrc
cp ./dotfiles/config.fish ~/.config/fish/config.fish

echo keyd wants keyboard config as root

sudo cp ./dotfiles/keyd-default.conf /etc/keyd/default.conf
sudo cp ./etc/pacman.conf /etc/pacman.conf

yay --norebuild --noredownload --nocleanafter --save
yay --notimeupdate --save
yay --noeditmenu --nodiffmenu --save
yay --noremovemake --save
yay --nocombinedupgrade --save

```


## Disable gnome automount

```bash #x
dconf write /org/gnome/desktop/media-handling/automount false
dconf write /org/gnome/desktop/media-handling/automount-open false
```

## Should link VSCode configs, remove if exist?

> ~/.config/Code/User/settings.json
> ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
> ~/.var/app/com.visualstudio.code/config/Code/User/settings.json

```bash

# VSCode package 
rm ~/.config/Code/User/settings.json
rm ~/.config/Code/User/keybindings.json
ln ./dotfiles/VSCode/User/settings.json ~/.config/Code/User/settings.json
ln ./dotfiles/VSCode/User/keybindings.json ~/.config/Code/User/keybindings.json

# VSCodium flatpak 
rm ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
rm ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln ./dotfiles/VSCode/User/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln ./dotfiles/VSCode/User/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json

# VSCode flatpak 
rm ~/.var/app/com.visualstudio.code/config/Code/User/settings.json
rm ~/.var/app/com.visualstudio.code/config/Code/User/keybindings.json
ln ./dotfiles/VSCode/User/settings.json ~/.var/app/com.visualstudio.code/config/Code/User/settings.json
ln ./dotfiles/VSCode/User/keybindings.json ~/.var/app/com.visualstudio.code/config/Code/User/keybindings.json

```


## Link Microsoft Edge config folder from flatpak package

`youtube-dl` or `yt-dlp` can use cookies from browser, but they look at default path

```bash
ln -s ~/.var/app/com.microsoft.Edge/config/microsoft-edge ~/.config/microsoft-edge
```