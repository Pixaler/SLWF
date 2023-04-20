#!/bin/bash

# Telegram
flatpak install flathub org.telegram.desktop

# Thunderbird
flatpak install flathub org.mozilla.Thunderbird
# Tray icon
flatpak install flathub com.ulduzsoft.Birdtray

# Okular
flatpak install flathub org.kde.okular

# Spotify
flatpak install flathub com.spotify.Client
flatpak run com.spotify.Client
bash <(curl -sSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/install.sh) -P /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/ -c

# Flatseal
flatpak install flathub com.github.tchx84.Flatseal

# qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent

# Syncthing
flatpak install flathub me.kozec.syncthingtk

# gThumb
flatpak install flathub org.gnome.gThumb

# Obsidian
flatpak install flathub org.gnome.gThumb
