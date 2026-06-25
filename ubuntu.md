wsl --install
Ubuntu Manualsmanpages.ubuntu.comUbuntu specific man pages online

winget install git
sudo apt update
sudo apt install git
sudo apt install alacritty
cd /mnt/c        # your C: drive
cd /mnt/d        # your D: drive
apt search video-player
apt search code-editor
apt search browser
pkgs.orgSearch		Ubuntu packages, see details
repology.org    	Compare packages across all Linux distros
alternativeto.net	Find alternatives and read community reviews
sudo snap install appname
sudo dpkg -i filename.deb
uname -r          # shows kernel version
uname -a          # shows everything about kernel
cat /etc/os-release        # shows distro name and version
lsb_release -a             # detailed distro info
		******ubuntu))))))
ls, cd, pwd, mkdir, touch, cp, mv, rm, find, locate			file and directory management
cat, less, more, head, tail, nano, vim, grep				file reading and editing
whoami, adduser, deluser, passwd, chmod, chown, sudo, su		user and permsion management
ps, top, htop, kill, killall, jobs, bg, fg, nohup			process management
apt install, apt remove, apt update, apt upgrade, snap install, dpkg	package management
ping, curl, wget, ifconfig, ip, netstat, ssh, scp, nmap			network management
df, du, lsblk, mount, umount, fdisk					disk and storage
uname, uptime, free, lscpu, lsmem, dmesg, journalctl			system info and monitoring
zip, unzip, tar, gzip, gunzip						comression and archiving
git init, git clone, git add, git commit, git push, git pull		git installed separately
bash, sh, cron, echo, export, alias, chmod +x				scripting and automation
grep, sed, awk, sort, cut, wc, diff					text processing very powerful

Universal (work everywhere)     → ls, cd, cp, mv, rm, grep, find,
                                   cat, chmod, ping, curl, tar, ps...

Ubuntu/Debian specific          → apt, dpkg, snap

Other distro specific           → yum, dnf, pacman, brew

# These work on Ubuntu, Debian, Fedora, CentOS, Arch, Mac etc.Work on Ubuntu AND almost all Linux distros
These are universal Linux/Unix commands:
ls, cd, cp, mv, rm, mkdir, touch
cat, less, more, head, tail
find, locate, grep, which
chmod, chown, sudo, su
ping, curl, wget
tar, zip, unzip, gzip
ps, kill, jobs, bg, fg
top, df, du, uname, whoami

Ubuntu/Debian ONLY
apt install        # only Ubuntu, Debian, Mint
apt-get install    # same family
dpkg               # Debian package tool
snap install       # Ubuntu specific

❌ NOT available on Ubuntu (other distros only)
yum install        # RedHat, CentOS, Fedora
dnf install        # Fedora, newer RedHat
pacman -S          # Arch Linux, Manjaro
brew install       # macOS only







