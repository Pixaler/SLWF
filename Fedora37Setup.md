# Setup Fedora 37 from scratch

**Sources:**
- Fedora Zero
https://plafon.gitbook.io/fedora-zero/fedora-zero/v-samom-nachale-... 
- https://github.com/proffix4/dev_for_fedora

## dnf setup
- echo "max_parallel_downloads=5\ndefaultyes=True\nkeepcache=True" | sudo tee -a /etc/dnf/dnf.conf
- sudo dnf autoremove && sudo dnf clean all

## Update system
- sudo dnf upgrade --refresh
- sudo reboot

## Install codecs
- sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-dev -y
- sudo dnf install lame\* --exclude=lame-devel -y 
- sudo dnf group upgrade --with-optional Multimedia -y

## System settings
- Apperance - Dark theme
- Bluetooth = False
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

## far2l
- Install rpm
- Restore config

## Icons
- sudo dnf install papirus-icon-theme -y

## Gnome Tweaks
- sudo dnf install gnome-tweaks -y
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
- Leagacy Applications - Adwaita-Dark

## Repository
- sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
- sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
- flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
- flatpak remote-modify --enable flathub
- sudo reboot

## Neovim
- sudo pacman -S nodejs npm
- yay -S clipman
- sudo pacman -S neovim
- Restore config
- Run nvim

## Gnome Extensions
- flatpak install flathub com.mattjakeman.ExtensionManager
- Dash to panel
  - Visible taskbar only and centred
  - App Icon Margin = 2px
  - Ungroup apllications
    - Unpin apps
  - Keep original gnome-shell top panel
- ArcMenu
	- Change to K-runner style
- Status Area Horizontal Spacing
- Caffeine
- Vitals
- AppIndicator and KStatusNotifierItem Support 
- Remove App menu
- Auto select headset
- No activies button
- sudo reboot

## Terminal
- Add Fira Code 14 in terminal
- zsh 
  - sudo dnf install zsh util-linux-user -y
  - grep tecmint /etc/passwd 
  - chsh -s $(which zsh)
  - grep tecmint /etc/passwd 
  - Restore config
  - zsh
- Moonfly theme
  - bash <(curl -sSl https://raw.githubusercontent.com/bluz71/vim-moonfly-colors/master/terminal_themes/gnome-terminal-moonfly.sh)
- sudo dnf install inxi htop neofetch -y

## Video cards
- sudo dnf install corectrl mangohud goverlay -y
- sudo nano /etc/polkit-1/rules.d/90-corectrl.rules

```
polkit.addRule(function(action, subject) {
      if ((action.id == "org.corectrl.helper.init" ||
           action.id == "org.corectrl.helperkiller.init") &&
          subject.local == true &&
          subject.active == true &&
          subject.isInGroup("pixaler")) {
              return polkit.Result.YES;
      }
  });
```
  
## Gaming
### Enable mangohud in flatpak
  - flatpak install org.freedesktop.Platform.VulkanLayer.MangoHud 
  - flatpak override --user --filesystem=xdg-config/MangoHud:ro
  
### Enable AMDGPU drivers
- sudo nvim /etc/default/grub

```
GRUB_CMDLINE_LINUX="<options> amdgpu.ppfeaturemask=0xffffffff radeon.si_support=0 amdgpu.si_support=1"
```
- sudo grub2-mkconfig -o /boot/grub2/grub.cfg
- sudo reboot

## Python
- sudo dnf install pip
- sudo pip install pipreqs
- pip install -r requirements.txt
- pip install selenium bs4
- sudo apt install python3.10-tk
* Android emulator

## Kernel
- sudo dnf install fedpkg fedora-packager rpmdevtools ncurses-devel pesign grubby
- sudo dnf install patch wget gcc ncurses-devel git git-core flex bison openssl-devel openssl elfutils-libelf-devel lz4 zstd bc grubby neofetch -y
- sudo dnf group install "development tools" -y
- cd <kernel_source_folder>
- make mrproper
- cp /boot/config-$(uname -r) .config
- grep -rin "0x6665. " .
  - Change limit to 83000 on gpu and 100000 on memory
- make oldconfig
- Disable in .config
  CONFIG_DEBUG_INFO_BTF
- make bzImage -j4
- make modules -j4
- sudo make modules_install -j4
- sudo make install -j4
- sudo grub2-mkconfig -o /boot/grub2/grub.cfg

---

# Archived
```
## Astronvim
- sudo dnf install clipman neovim nodejs npm gcc-c++ -y
- git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
- git clone https://github.com/Pixaler/astronvim_config ~/.config/nvim/lua/user
- nvim 
- :Mason and install all packages (python, html, css, lua)
- :TSInstall python html css lua

## Emacs
- sudo dnf install emacs -y
- Run emacs and install use-package
- Restart and done
- Set Emacs(GUI) as default for .org files
```

