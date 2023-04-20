# Setup PopOS 22.04 from scratch

## Update system
- sudo apt update && sudo apt dist-upgrade -y
- sudo reboot
* System settings
- Bluetooth = False
- Desktop - Disable dock
- Sound
  - Over-Amplification = True
  - System Sounds = False
- Power
	- Screen Blank = 15min
	- Dim Screen = False
- Touchpad = False
- Keyboard
	- Add layouts
	- Change "Run comand" shortcut to Shift+Alt+F2
- Region - Change formats to United Kingdom
* Apps Settings
- Install thunderbird
- Import Firefox and Thunderbird profile

## far2l
- sudo apt-get install gawk m4 libwxgtk3.0-gtk3-dev libx11-dev libxi-dev libpcre3-dev libxerces-c-dev libspdlog-dev libuchardet-dev libssh-dev libssl-dev libsmbclient-dev libnfs-dev libneon27-dev libarchive-dev cmake g++ git checkinstall
- git clone https://github.com/elfmz/far2l
- cd far2l
- mkdir build
- cd build
- cmake -DUSEWX=yes -DCMAKE_BUILD_TYPE=Release ..
- make -j$(nproc --all)
- sudo make install
- sudo ldconfig
- Install Fira Code fonts
- Restore config
- Launch

## Gnome Tweaks
- sudo apt install gnome-tweaks -y
- Fonts
  - Scaling Factor = 1.10
- Keyboard & Mouse 
  - Switching to another layout = Capslock
- Top Bar
  - Weekday, Seconds = True
- Window Titlebars 
  - Maximize = True
- Windows
  - Center New Windows = True
- Add far2l to startup

## Gnome Extensions
- Install browser extensions Gnome Extensions
- Dash to panel
  - Visible taskbar only and centred
  - App Icon Margin = 2px
  - Ungroup apllications
	  - Unpin apps
  - Keep original gnome-shell top panel
- Status Area Horizontal Spacing
- Caffeine
- Vitals
- AppIndicator and KStatusNotifierItem Support 
- sudo reboot

## Terminal
- Add Fira Code 14 in terminal
- zsh 
  - sudo apt install zsh -y
  - grep tecmint /etc/passwd 
  - chsh -s $(which zsh)
  - grep tecmint /etc/passwd 
  - Launch terminal
- Moonfly theme
  - sudo apt install gconf2
  - bash <(curl -sSl https://raw.githubusercontent.com/bluz71/vim-moonfly-colors/master/terminal_themes/gnome-terminal-moonfly.sh)
- sudo apt install inxi htop neofetch -y

## Flatpak
- flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Video cards
- sudo nvim /etc/modprobe.d/amdgpu.conf
	options amdgpu si_support=1
  options amdgpu cik_support=1
- sudo nvim /etc/modprobe.d/radeon.conf
	blacklist radeon
- sudo update-initramfs -c -k all

## Appereance
- Icons
  - sudo apt install papirus-icon-theme
  - Select in tweaks
  
## Python
- sudo apt install python3.10-venv pip python-is-python3
- sudo pip install pipreqs
- pip install -r requirements.txt
- pip install selenium bs4
- sudo apt install python3.10-tk

## Hardware setup
- Limit CPU freq - echo 2600000 | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

## Kernel
- sudo apt-get build-dep linux-image-$(uname -r)
- sudo apt install build-essential libncurses5-dev fakeroot xz-utils libelf-dev bison flex dwarves
- cp /boot/config-$(uname -r) .config
If fails on certificate: https://askubuntu.com/questions/1329538/compiling-the-kernel-5-11-11

---

# Archived
```
## Astronvim
- sudo apt install xclip
- curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage - - chmod u+x nvim.appimage
- cp -r -f nvim.appimage ~/opt/Nvim
- git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
- git clone https://github.com/Pixaler/astronvim_config ~/.config/nvim/lua/user
- curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
- sudo apt-get install -y nodejs npm
- sudo apt install python3.10-venv
- nvim 
- :Mason and install all packages (python, html, css, lua)
- :TSInstall python html css lua
- 
## Emacs
- sudo apt install emacs
- Run emacs and install use-package
- Restart and done
- Set Emacs(GUI) as default for .org files

```