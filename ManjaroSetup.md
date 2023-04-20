# Setup Manjaro linux from scratch

**Sources:** 
- https://github.com/plafonlinux/MIF/blob/master/UNIVERSAL/M.I.F.%20Universal.pdf

## First launch
* Manjaro Hello
- Disable 'Launch at startup'

## Mount disk
* Mount disk
- Launch 'Disks' 
- Select disk and partitions that you want to mount
- Click on gears icon - Edit Mount Options
- Uncheck 'User Session Defaults' and change mount point to path: /mnt/storage
  
## Pacman
- sudo pacman-mirrors --country Poland
- sudo nano /etc/pacman.conf
	ParallelDownloads = 5


## Pamac
3 dots - Prefrences
- General
	- Parallel downloads = 4
	- Use mirrors from = "Poland"
- Advanced
	- Tick all options 
- Third Party
	Enable Aur, Flatpak and enable 'Check for update' to this


## Update system
- Ctrl+Alt+F3
- sudo pacman -Syyuu
- sudo reboot

## Settings
- Login in Google account
- Sounds
	- Disable system sound
- Power
	- Screen Blank = 15min
	- Show battery percentege = True
- Kyboard
	- Add layouts
	- Change keyboard shortcut Alt+F2 to Alt+Shift+F2
	- "Switch window" set Alt+Tab
	
## Far2l
- sudo pacman -S base-devel
- pamac build far2l-git
- Install Fira Code Nerd font Mono and Regular
	- Copy file to $HOME/.local/share/fonts
- Copy configs to home folder
- Launch far2l

## Gnome tweaks
- Over-Amplification = True
- Fonts
	- Scaling factor = 1.10
- Swith layout button = CapsLock
- Top Bar
	- Weekday = True
	- Seconds = True
- Windows 
	- Center New Windows = True
	- Resize witsh Secondary-Click = True
	
## Gnome extensions
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
- Remove App menu
- Auto select headset
- No activies button
- Vitals
	- Left side
- sudo reboot

## Terminal
- Add Fira Code 14 in terminal
- Copy zsh configs to home folder
- Moonfly theme - bash <(curl -sSl https://raw.githubusercontent.com/bluz71/vim-moonfly-colors/master/terminal_themes/gnome-terminal-moonfly.sh)
- sudo pacman -S inxi htop neofetch

## Neovim
- sudo pacman -S nodejs npm
- yay -S clipman
- sudo pacman -S neovim
- Restore config
- Run nvim

##  Kernel
- sudo pacman -S bc cpio base-devel xmlto  
- mkdir ~/kernelbuild && cd kernelbuild
- wget https://github.com/xanmod/linux/archive/6.2.9-xanmod1.tar.gz
- tar -xf 6.2.9-xanmod1.tar.gz
- cd linux-6.2.9-xanmod1
- make mrproper
- zcat /proc/config.gz > .config
- make oldconfig
- grep -rin "0x6665. " .
- nvim ./drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c +3439
- nvim ./drivers/gpu/drm/radeon/si_dpm.c +2963
- make bzImage -j8
- make modules -j8
- sudo make modules_install -j8

- sudo make install -j8
or
- sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux629
- sudo cp /etc/mkinitcpio.d/linux61.preset /etc/mkinitcpio.d/linux629.preset
- sudo mkinitcpio -p linux629
- sudo grub-mkconfig -o /boot/grub/grub.cfg

## Gaming
- flatpak install org.freedesktop.Platform.VulkanLayer.MangoHud 
- flatpak override --user --filesystem=xdg-config/MangoHud:ro
- sudo nvim /etc/default/grub
```
GRUB_CMDLINE_LINUX="<options> amdgpu.ppfeaturemask=0xffffffff radeon.si_support=0 amdgpu.si_support=1"
```
- sudo grub-mkconfig -o /boot/grub/grub.cfg
- sudo pacman -S mangohud corectrl 
- Lutris - flatpak install flathub net.lutris.Lutris
	- add /mnt/storage in Flatseal
- ProtonUPqt -flatpak install flathub net.davidotek.pupgui2

## Python
- Install python-pip
- Install tk (Tkinter)
- pip install pipreqs - for auto-generate requirements.txt

---

# Archived
```
## Astronvim
- sudo pacman -S nodejs npm
- pamac build clipman
- sudo pacman -S neovim
- git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
- git clone https://github.com/Pixaler/astronvim_config ~/.config/nvim/lua/user
- Run nvim
- TSInstall and Mason

## Emacs 
- sudo pacman -S emacs
- emacs
	- package-install
	- use-package
- Copy .emacs to home directory
- Launch
```












