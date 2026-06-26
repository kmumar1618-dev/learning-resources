# Ubuntu 150 Advanced Commands Reference

> A categorized reference guide for intermediate to advanced Ubuntu users.
> Click any command name to learn more via `man <command>` or `tldr <command>`.

---

## Table of Contents

1. [File & Directory](#1-file--directory)
2. [Text Processing](#2-text-processing)
3. [System & Process](#3-system--process)
4. [Networking](#4-networking)
5. [Disk & Storage](#5-disk--storage)
6. [User & Permissions](#6-user--permissions)
7. [Compression & Archive](#7-compression--archive)
8. [Shell & Scripting](#8-shell--scripting)
9. [Monitoring & Performance](#9-monitoring--performance)
10. [Package Management](#10-package-management)
11. [Security & Crypto](#11-security--crypto)
12. [Miscellaneous Power Tools](#12-miscellaneous-power-tools)

---

## 1. File & Directory

| Command | Description | Level |
|---------|-------------|-------|
| `find` | Search files/dirs by name, size, time | Advanced |
| `locate` | Fast filename search using DB | Intermediate |
| `tree` | Display directory as tree | Intermediate |
| `stat` | Detailed file metadata | Advanced |
| `file` | Detect file type | Intermediate |
| `ln` | Create hard/symbolic links | Advanced |
| `shred` | Securely delete file | Advanced |
| `rsync` | Sync files/dirs efficiently | Advanced |
| `rename` | Batch rename files | Advanced |
| `watch` | Run command repeatedly | Intermediate |
| `lsof` | List open files and processes | Advanced |
| `dd` | Low-level copy/convert data | Advanced |

### Examples

```bash
# find — most powerful file search
find /home -name '*.log' -mtime -7
find / -size +100M -type f

# locate — fast search using cached DB
locate nginx.conf
updatedb          # refresh database

# tree — visualize directory structure
tree -L 2
tree -a /etc

# stat — detailed file info
stat filename.txt

# file — detect type regardless of extension
file image.png
file /bin/ls

# ln — create symlink (shortcut)
ln -s /path/to/file linkname
ln file hardlink

# shred — secure delete
shred -u -z filename

# rsync — efficient sync/backup
rsync -avz src/ dest/
rsync -avz user@host:/remote ./local

# rename — batch rename with regex
rename 's/.txt/.md/' *.txt

# watch — monitor output live
watch -n 2 df -h
watch ls -la

# lsof — see what process uses a port/file
lsof -i :80
lsof -u username

# dd — disk cloning and image creation (DANGEROUS)
dd if=/dev/sda of=backup.img bs=4M
dd if=/dev/zero of=file bs=1M count=100
```

---

## 2. Text Processing

| Command | Description | Level |
|---------|-------------|-------|
| `grep` | Search text patterns | Advanced |
| `sed` | Stream editor for text | Advanced |
| `awk` | Powerful text/data processing | Advanced |
| `cut` | Extract columns from text | Intermediate |
| `sort` | Sort lines of text | Intermediate |
| `uniq` | Remove duplicate lines | Intermediate |
| `tr` | Translate/delete characters | Intermediate |
| `wc` | Count lines/words/chars | Intermediate |
| `diff` | Compare two files | Intermediate |
| `tee` | Split output to file and stdout | Advanced |
| `xargs` | Build commands from stdin | Advanced |
| `paste` | Merge lines of files side by side | Advanced |

### Examples

```bash
# grep — search patterns in files
grep -r 'error' /var/log/
grep -n 'TODO' *.py
grep -v 'pattern' file       # invert match
grep -i 'keyword' file       # case insensitive

# sed — find and replace
sed 's/old/new/g' file.txt
sed -i 's/foo/bar/g' file.txt    # edit in-place
sed -n '5,10p' file.txt          # print lines 5-10

# awk — column-based processing
awk '{print $1, $3}' file
awk -F',' '{print $2}' data.csv
awk '/error/ {print NR, $0}' log

# cut — extract specific columns
cut -d',' -f2 file.csv
cut -c1-10 file.txt

# sort — sort lines
sort file.txt
sort -r -n file.txt     # reverse numeric sort
sort -u file.txt        # unique only

# uniq — remove duplicates (must sort first)
sort file | uniq
uniq -c file.txt        # count occurrences
uniq -d file.txt        # show only duplicates

# tr — translate characters
echo 'hello' | tr 'a-z' 'A-Z'
cat file | tr -d '\n'

# wc — count
wc -l file.txt          # count lines
wc -w file.txt          # count words
ls | wc -l              # count files

# diff — compare files
diff file1.txt file2.txt
diff -u file1 file2     # unified format

# tee — save and display output
ls | tee output.txt
command | tee -a log.txt    # append

# xargs — build commands from stdin
find . -name '*.txt' | xargs grep 'error'
cat urls.txt | xargs wget

# paste — merge files side by side
paste file1.txt file2.txt
paste -d',' col1 col2
```

---

## 3. System & Process

| Command | Description | Level |
|---------|-------------|-------|
| `htop` | Interactive process viewer | Intermediate |
| `ps` | Snapshot of processes | Advanced |
| `kill` | Send signal to process | Advanced |
| `killall` | Kill by process name | Advanced |
| `nice` | Set process priority | Advanced |
| `renice` | Change priority of running process | Advanced |
| `nohup` | Run command immune to hangups | Advanced |
| `systemctl` | Control systemd services | Advanced |
| `journalctl` | View systemd logs | Advanced |
| `cron` | Schedule recurring tasks | Advanced |
| `at` | Schedule one-time task | Advanced |
| `strace` | Trace system calls of a process | Advanced |

### Examples

```bash
# htop — interactive process monitor
htop
htop -u username        # filter by user

# ps — process snapshot
ps aux
ps aux | grep nginx
ps -ef --forest         # show parent/child tree

# kill — send signal to PID
kill 1234
kill -9 1234            # force kill
kill -SIGTERM 1234      # graceful kill

# killall — kill by name
killall nginx
killall -9 firefox

# nice — set priority at launch (-20=highest, 19=lowest)
nice -n 10 command
sudo nice -n -5 command

# renice — change priority of running process
renice +5 -p 1234
renice -10 -u username

# nohup — keep running after logout
nohup ./script.sh &
nohup python3 server.py > out.log &

# systemctl — manage services
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable ssh        # start at boot
systemctl disable ssh
systemctl status apache2
systemctl list-units --type=service

# journalctl — view logs
journalctl -u nginx
journalctl -f               # follow live
journalctl --since '1 hour ago'

# cron — recurring scheduled tasks
crontab -e      # edit crontab
crontab -l      # list crontab
# Format: min hr day month weekday command
# 0 2 * * * /backup.sh    (run at 2am daily)

# at — one-time scheduled task
at now + 5 minutes
at 10:30 PM
# type command, then Ctrl+D to save

# strace — trace system calls
strace ls
strace -p 1234      # attach to running process
```

---

## 4. Networking

| Command | Description | Level |
|---------|-------------|-------|
| `ss` | Socket statistics (modern netstat) | Advanced |
| `netstat` | Network connections & stats | Advanced |
| `curl` | Transfer data via URLs | Advanced |
| `wget` | Download files from web | Intermediate |
| `ssh` | Secure shell remote login | Advanced |
| `scp` | Secure copy over SSH | Advanced |
| `nmap` | Network port scanner | Advanced |
| `iptables` | Configure firewall rules | Advanced |
| `tcpdump` | Capture network packets | Advanced |
| `dig` | DNS lookup tool | Intermediate |
| `traceroute` | Trace network path to host | Intermediate |
| `ip` | Modern network config tool | Advanced |

### Examples

```bash
# ss — socket statistics
ss -tuln
ss -tulnp | grep :80
ss -s                   # summary

# netstat — network connections
netstat -tuln
netstat -anp | grep LISTEN

# curl — transfer data
curl -O https://example.com/file
curl -X POST -d 'data' url
curl -H 'Authorization: Bearer TOKEN' url

# wget — download files
wget https://example.com/file.zip
wget -c url             # resume download
wget -r url             # recursive download

# ssh — remote login
ssh user@host
ssh -p 2222 user@host
ssh -i key.pem user@host

# scp — secure copy
scp file.txt user@host:/path/
scp -r folder/ user@host:/dest/

# nmap — port scanning
nmap 192.168.1.1
nmap -sV -p 80,443 host     # version detection
nmap -sn 192.168.1.0/24     # ping scan subnet

# iptables — firewall rules
iptables -L
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -j DROP

# tcpdump — capture packets
tcpdump -i eth0
tcpdump -i any port 80
tcpdump -w capture.pcap     # write to file

# dig — DNS lookup
dig google.com
dig google.com MX           # mail records
dig @8.8.8.8 example.com   # use specific DNS server

# traceroute — trace network path
traceroute google.com
traceroute -n google.com    # no DNS lookups (faster)

# ip — network configuration
ip addr show
ip route show
ip link set eth0 up
```

---

## 5. Disk & Storage

| Command | Description | Level |
|---------|-------------|-------|
| `df` | Disk space of filesystems | Intermediate |
| `du` | Disk usage of files/dirs | Intermediate |
| `lsblk` | List block devices | Intermediate |
| `fdisk` | Partition management | Advanced |
| `mount` | Mount filesystems | Advanced |
| `fsck` | Filesystem check and repair | Advanced |
| `mkfs` | Create filesystem | Advanced |
| `blkid` | Show block device attributes | Advanced |
| `smartctl` | Monitor disk health (SMART) | Advanced |

### Examples

```bash
# df — disk space
df -h
df -h /home

# du — directory size
du -sh /var/log
du -sh * | sort -h
du -h --max-depth=1

# lsblk — list block devices
lsblk
lsblk -f                # show filesystem type

# fdisk — partition management (DANGEROUS)
sudo fdisk -l           # list partitions
sudo fdisk /dev/sda     # interactive mode

# mount — mount filesystem
mount /dev/sdb1 /mnt/usb
mount -t ntfs /dev/sdb1 /mnt
mount | grep sdb        # show mounts

# fsck — check and repair filesystem
sudo fsck /dev/sda1
sudo fsck -y /dev/sdb1  # auto-yes

# mkfs — format partition (DESTRUCTIVE)
sudo mkfs.ext4 /dev/sdb1
sudo mkfs.vfat /dev/sdc1

# blkid — show device attributes
blkid
sudo blkid /dev/sda1

# smartctl — disk health
sudo smartctl -a /dev/sda
sudo smartctl -t short /dev/sda
```

---

## 6. User & Permissions

| Command | Description | Level |
|---------|-------------|-------|
| `chmod` | Change file permissions | Advanced |
| `chown` | Change file owner/group | Advanced |
| `sudo` | Run command as superuser | Intermediate |
| `su` | Switch user | Intermediate |
| `useradd` | Create new user | Advanced |
| `usermod` | Modify user account | Advanced |
| `passwd` | Change user password | Intermediate |
| `groups` | Show user group membership | Intermediate |
| `visudo` | Safely edit sudoers file | Advanced |
| `umask` | Set default file permissions | Advanced |

### Examples

```bash
# chmod — change permissions
chmod 755 script.sh         # rwxr-xr-x
chmod +x file               # add execute
chmod -R 644 /var/www       # recursive

# Permission numbers:
# 7 = rwx (read+write+execute)
# 6 = rw-  (read+write)
# 5 = r-x  (read+execute)
# 4 = r--  (read only)

# chown — change owner
chown user:group file
chown -R www-data /var/www

# sudo — run as root
sudo apt update
sudo -u otheruser command
sudo -i                     # interactive root shell

# su — switch user
su username
su - username               # load full environment
su -                        # switch to root

# useradd — create user
sudo useradd -m -s /bin/bash john
sudo useradd -G sudo,www-data john

# usermod — modify user
sudo usermod -aG sudo john      # add to group
sudo usermod -s /bin/zsh john   # change shell

# passwd — change password
passwd                      # change own password
sudo passwd john
sudo passwd -l john         # lock account

# groups — show group membership
groups
groups username

# visudo — edit sudoers safely
sudo visudo

# umask — default permissions
umask
umask 022                   # files=644, dirs=755
umask 027                   # files=640, dirs=750
```

---

## 7. Compression & Archive

| Command | Description | Level |
|---------|-------------|-------|
| `tar` | Archive files (tape archive) | Advanced |
| `gzip` | Compress with gzip | Intermediate |
| `zip` | Create zip archives | Intermediate |
| `7z` | 7-zip compression (best ratio) | Advanced |

### Examples

```bash
# tar — the most common archive tool
tar -czvf archive.tar.gz folder/    # create
tar -xzvf archive.tar.gz            # extract
tar -tzvf archive.tar.gz            # list contents

# Flags: -c=create -x=extract -z=gzip -j=bzip2
#        -v=verbose -f=file

# gzip — compress single files
gzip file.txt
gzip -d file.txt.gz         # decompress
gzip -9 file.txt            # max compression
gzip -k file.txt            # keep original

# zip — Windows-compatible archives
zip archive.zip file1 file2
zip -r archive.zip folder/
unzip archive.zip
unzip -l archive.zip        # list contents

# 7z — best compression ratio
7z a archive.7z folder/     # add/create
7z x archive.7z             # extract
7z l archive.7z             # list
# Install: sudo apt install p7zip-full
```

---

## 8. Shell & Scripting

| Command | Description | Level |
|---------|-------------|-------|
| `alias` | Create command shortcuts | Intermediate |
| `export` | Set environment variables | Intermediate |
| `source` | Execute script in current shell | Advanced |
| `set` | Set shell options/variables | Advanced |
| `trap` | Catch signals in scripts | Advanced |
| `eval` | Execute string as command | Advanced |
| `declare` | Declare variables with types | Advanced |
| `read` | Read user input in scripts | Intermediate |
| `printf` | Formatted output | Advanced |
| `test` | Evaluate conditions | Advanced |

### Examples

```bash
# alias — create shortcuts
alias ll='ls -lah'
alias update='sudo apt update && sudo apt upgrade'
alias ..='cd ..'
alias           # list all aliases

# export — environment variables
export PATH=$PATH:/new/path
export MY_VAR='value'
export -p       # list all exported vars

# source — reload config / run in current shell
source ~/.bashrc
source script.sh
. ~/.profile    # same as source

# set — shell options (use in scripts)
set -e          # exit on any error
set -x          # debug mode (print commands)
set -u          # error on undefined variable
set -euo pipefail   # recommended combo

# trap — cleanup on exit/signal
trap 'echo cleanup' EXIT
trap 'rm -f /tmp/lockfile' INT TERM EXIT

# eval — execute string as command
cmd='ls -la'
eval $cmd

# declare — typed variables
declare -i num=5        # integer
declare -a arr=(1 2 3)  # array
declare -r CONST='fixed' # readonly
declare -x VAR='value'  # export
declare -p VAR          # print declaration

# read — get user input
read -p 'Enter name: ' name
read -s -p 'Password: ' pass   # silent input
read -t 5 answer                # 5 second timeout

# printf — formatted output
printf '%s is %d years old\n' Alice 30
printf '%-10s %5d\n' item 42

# test — condition evaluation
test -f file && echo 'file exists'
[ -d /tmp ] && echo 'is directory'
[[ $x -gt 5 ]] && echo 'x is greater than 5'
# -f=file exists, -d=directory, -z=empty, -n=non-empty
```

---

## 9. Monitoring & Performance

| Command | Description | Level |
|---------|-------------|-------|
| `vmstat` | Virtual memory stats | Advanced |
| `iostat` | CPU and I/O statistics | Advanced |
| `sar` | System activity reporter | Advanced |
| `free` | Memory usage overview | Intermediate |
| `uptime` | System uptime and load | Intermediate |
| `dmesg` | Kernel ring buffer messages | Advanced |
| `lscpu` | CPU architecture info | Intermediate |
| `sensors` | Hardware temperature readings | Advanced |

### Examples

```bash
# vmstat — virtual memory stats
vmstat 2 5          # every 2 seconds, 5 times
vmstat -s           # summary

# iostat — CPU and disk I/O
iostat
iostat -x 2         # extended stats every 2s
iostat -d /dev/sda  # specific disk
# Install: sudo apt install sysstat

# sar — system activity report
sar -u 2 5          # CPU usage
sar -r 2 5          # memory usage
sar -d 2 5          # disk activity
# Part of sysstat package

# free — memory overview
free -h             # human readable
free -h -s 2        # repeat every 2 seconds

# uptime — system load
uptime
uptime -p           # pretty format
# Load average: 1min 5min 15min
# > number of CPU cores = overloaded

# dmesg — kernel messages
dmesg | tail -20
dmesg | grep error
dmesg -T            # human readable timestamps

# lscpu — CPU info
lscpu
lscpu | grep 'CPU(s)'

# sensors — hardware temperatures
sensors
watch -n 1 sensors
# Install: sudo apt install lm-sensors
# Setup: sudo sensors-detect
```

---

## 10. Package Management

| Command | Description | Level |
|---------|-------------|-------|
| `apt` | Main package manager (Ubuntu) | Intermediate |
| `dpkg` | Low-level Debian package tool | Advanced |
| `snap` | Snap package manager | Intermediate |
| `apt-cache` | Query package cache | Advanced |
| `add-apt-repository` | Add PPA repository | Advanced |

### Examples

```bash
# apt — main package manager
sudo apt update                 # refresh package lists
sudo apt upgrade                # install available updates
sudo apt install nginx          # install package
sudo apt remove nginx           # remove package
sudo apt remove --purge nginx   # remove + config files
sudo apt autoremove             # remove unused packages
apt search keyword              # search packages
apt show nginx                  # package details
apt list --installed            # list installed

# dpkg — low-level package tool
sudo dpkg -i package.deb        # install .deb file
dpkg -l | grep nginx            # list installed
dpkg -r nginx                   # remove
dpkg -L nginx                   # list files from package
dpkg --get-selections           # all installed packages

# snap — containerized packages
sudo snap install vlc
snap list                       # show installed snaps
snap refresh                    # update all snaps
sudo snap remove vlc

# apt-cache — query package info
apt-cache search nginx
apt-cache show nginx
apt-cache policy nginx          # show available versions

# add-apt-repository — add PPAs
sudo add-apt-repository ppa:name/ppa
sudo add-apt-repository universe
sudo apt update                 # always update after adding repo
```

---

## 11. Security & Crypto

| Command | Description | Level |
|---------|-------------|-------|
| `ufw` | Uncomplicated firewall | Advanced |
| `openssl` | SSL/TLS & crypto toolkit | Advanced |
| `gpg` | GNU Privacy Guard encryption | Advanced |
| `ssh-keygen` | Generate SSH key pairs | Advanced |
| `fail2ban` | Intrusion prevention system | Advanced |
| `auditctl` | Configure audit rules | Advanced |

### Examples

```bash
# ufw — simple firewall management
sudo ufw enable
sudo ufw disable
sudo ufw allow 22/tcp           # allow SSH
sudo ufw allow 80/tcp           # allow HTTP
sudo ufw deny 23                # block telnet
sudo ufw status verbose         # show all rules
sudo ufw delete allow 80/tcp    # remove rule

# openssl — crypto toolkit
openssl rand -hex 32                        # random password
openssl genrsa -out key.pem 2048           # generate RSA key
openssl req -new -x509 -key key.pem -out cert.pem   # self-signed cert
openssl s_client -connect host:443          # inspect SSL

# gpg — encryption
gpg --gen-key                   # generate keypair
gpg -c file.txt                 # symmetric encrypt
gpg -d file.txt.gpg             # decrypt
gpg --list-keys                 # list keys

# ssh-keygen — generate SSH keys
ssh-keygen -t ed25519           # modern (recommended)
ssh-keygen -t rsa -b 4096       # traditional RSA
ssh-copy-id user@host           # copy key to server
cat ~/.ssh/id_ed25519.pub       # view public key

# fail2ban — block brute force
sudo fail2ban-client status
sudo fail2ban-client status sshd
sudo fail2ban-client unban 1.2.3.4
# Config: /etc/fail2ban/jail.conf

# auditctl — file access auditing
sudo auditctl -w /etc/passwd -p wa    # watch file for write/attr
sudo auditctl -l                       # list rules
ausearch -k passwd_changes             # search audit logs
```

---

## 12. Miscellaneous Power Tools

| Command | Description | Level |
|---------|-------------|-------|
| `tmux` | Terminal multiplexer | Advanced |
| `screen` | Terminal session manager | Advanced |
| `bc` | Arbitrary precision calculator | Intermediate |
| `date` | Display/set date and time | Intermediate |
| `history` | Command history | Intermediate |
| `env` | Show/run with environment vars | Advanced |
| `timeout` | Run command with time limit | Advanced |
| `parallel` | Run commands in parallel | Advanced |

### Examples

```bash
# tmux — terminal multiplexer
tmux                        # start new session
tmux new -s mysession       # named session
tmux attach -t mysession    # re-attach
tmux ls                     # list sessions
# Prefix: Ctrl+b
# Ctrl+b c  = new window
# Ctrl+b %  = split vertical
# Ctrl+b "  = split horizontal
# Ctrl+b d  = detach

# screen — older session manager
screen
screen -S name              # named session
screen -r name              # re-attach
screen -ls                  # list sessions
# Prefix: Ctrl+a
# Ctrl+a d  = detach

# bc — calculator
echo '5.5 * 3' | bc
echo 'scale=4; 1/3' | bc   # 4 decimal places
bc -l                       # math library (sin, cos, etc)

# date — date and time
date
date '+%Y-%m-%d %H:%M:%S'  # custom format
date -d 'next monday'
date -d '2 days ago'

# history — command history
history
history | grep ssh
!42                         # run command #42 from history
!!                          # repeat last command
!ssh                        # repeat last ssh command
Ctrl+R                      # interactive history search

# env — environment variables
env                         # show all variables
env | grep PATH
env -i command              # run with empty environment

# timeout — time-limited execution
timeout 5s ping google.com
timeout 30 ./long_script.sh
timeout --kill-after=5 30 command   # force kill after 5s extra

# parallel — run jobs in parallel
parallel echo ::: A B C
cat urls.txt | parallel wget {}
ls *.jpg | parallel convert {} {.}.png
# Install: sudo apt install parallel
```

---

## Quick Reference Summary

| Level | Commands |
|-------|----------|
| Intermediate | `locate`, `tree`, `file`, `watch`, `cut`, `sort`, `uniq`, `tr`, `wc`, `diff`, `htop`, `wget`, `dig`, `traceroute`, `df`, `du`, `lsblk`, `sudo`, `su`, `passwd`, `groups`, `gzip`, `zip`, `alias`, `export`, `read`, `free`, `uptime`, `lscpu`, `apt`, `snap`, `bc`, `date`, `history` |
| Advanced | Everything else in this guide |

## Useful Combinations (Pipes)

```bash
# Find large files and sort by size
du -sh * | sort -rh | head -10

# Monitor a log file for errors
tail -f /var/log/syslog | grep --color error

# Find and kill a process by name
ps aux | grep nginx | awk '{print $2}' | xargs kill

# Count unique IPs in access log
awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn

# Find files changed in last 24 hours
find /var/www -mtime -1 -type f

# Show top 10 memory-consuming processes
ps aux --sort=-%mem | head -10

# Backup a directory with timestamp
tar -czvf backup_$(date +%Y%m%d).tar.gz /important/folder
```

---

## Getting Help

```bash
man <command>       # full manual
tldr <command>      # simple examples (install: sudo apt install tldr)
<command> --help    # quick help
apropos keyword     # find commands by topic
whatis <command>    # one-line description
```

---

*Generated for Ubuntu 20.04+ | Commands tested on bash shell*
