# Ubuntu Command Flags — Memorization Guide

> Learn, understand, and memorize the most useful flags for advanced Ubuntu usage.
> Focus on patterns first — most flags follow predictable first-letter logic.

---

## Table of Contents

1. [The Golden Rule — Universal Patterns](#1-the-golden-rule--universal-patterns)
2. [Memorization Tricks](#2-memorization-tricks)
3. [Flags by Command](#3-flags-by-command)
4. [Flag Families (by what they control)](#4-flag-families-by-what-they-control)
5. [Most Useful Combos to Memorize](#5-most-useful-combos-to-memorize)
6. [Quick Quiz — Test Yourself](#6-quick-quiz--test-yourself)

---

## 1. The Golden Rule — Universal Patterns

> Most flags are the **first letter** of what they do.
> Learn these once — they apply across dozens of commands.

| Flag | Meaning | Commands it appears in |
|------|---------|----------------------|
| `-r` / `-R` | **R**ecursive | `cp -r` `rm -r` `chmod -R` `grep -r` `ls -R` |
| `-v` | **V**erbose (show more detail) | `tar -v` `rsync -v` `rm -v` `curl -v` |
| `-f` | **F**orce / **F**ile | `rm -f` `tar -f` `cp -f` |
| `-h` | **H**uman readable (KB, MB, GB) | `ls -h` `df -h` `du -h` `free -h` |
| `-n` | **N**umeric / Count / No-op | `ping -n` `ss -n` `grep -n` `head -n` |
| `-i` | **I**nteractive / Ignore case / In-place | `rm -i` `grep -i` `sed -i` |
| `-l` | **L**ong format / List / Listening | `ls -l` `ss -l` `grep -l` `wc -l` |
| `-a` | **A**ll / **A**rchive | `ls -a` `tar -a` `ps -a` `rsync -a` |
| `-o` | **O**utput file | `curl -o` `gcc -o` `nmap -o` |
| `-p` | **P**ort / **P**rocess / **P**reserve | `ssh -p` `ss -p` `mkdir -p` |
| `-e` | **E**xpression / **E**xecute | `grep -e` `sed -e` `xargs -e` |
| `-s` | **S**ilent / **S**ummary / **S**ize | `curl -s` `du -s` `read -s` |
| `-u` | **U**ser / **U**nique / **U**pdate | `sort -u` `rsync -u` `tar -u` |
| `-x` | E**x**tract / E**x**clude / Debug | `tar -x` `bash -x` `grep -x` |
| `-c` | **C**reate / **C**ount / **C**ontinue | `tar -c` `grep -c` `wget -c` |
| `-d` | **D**elimiter / **D**irectory / **D**elete | `cut -d` `find -d` `tr -d` |
| `-t` | **T**ype / **T**imeout / **T**CP | `find -t` `read -t` `ssh -t` |
| `-w` | **W**rite / **W**atch / **W**idth | `tcpdump -w` `auditctl -w` `grep -w` |

---

## 2. Memorization Tricks

### Trick 1 — First Letter Rule
Most flags are the first letter of what they do:
```
-r = recursive
-v = verbose
-h = human readable
-f = force
-a = all
-s = silent
-n = numeric
-i = ignore case
```

### Trick 2 — Short vs Long Flags
Both forms do the same thing. Use long form to understand, short form to type fast:
```bash
-v          = --verbose
-r          = --recursive
-h          = --human-readable
-n          = --numeric
```

### Trick 3 — Stack Short Flags Together
Short flags can be combined into one block:
```bash
ls -l -a -h   →   ls -lah
tar -c -z -v -f   →   tar -czvf
grep -r -i -n   →   grep -rin
```
Think of stacked flags as initials:
- `lah` = **l**ong **a**ll **h**uman
- `czvf` = **c**reate **z**ip **v**erbose **f**ile
- `aux` = **a**ll **u**ser e**x**tra

### Trick 4 — Uppercase Often Means Something Bigger
```bash
-r = recursive (grep, cp, rm)
-R = Recursive (chmod, ls)      ← capital for chmod
-o = output to custom file
-O = Output with Original name  ← capital keeps original name
-v = verbose
-V = Version                    ← capital for version
```

### Trick 5 — Context Matters for Shared Flags
Some flags mean different things in different commands:
```
-i  in grep   = ignore case
-i  in rm     = interactive (ask before deleting)
-i  in sed    = in-place (edit file directly)

-f  in rm     = force (no prompt)
-f  in tar    = file (specify archive name)

-v  in grep   = invert match
-v  in tar    = verbose
-v  in ssh    = verbose debug
```
> When in doubt: run `command --help | grep -- '-v'` to check

---

## 3. Flags by Command

### `ls` — List Files

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-l` | **L**ong format (permissions, size, date) | l = long | `ls -l` |
| `-a` | **A**ll files including hidden (.files) | a = all | `ls -a` |
| `-h` | **H**uman readable sizes (KB, MB) | h = human | `ls -lh` |
| `-r` | **R**everse sort order | r = reverse | `ls -lr` |
| `-t` | Sort by modification **t**ime | t = time | `ls -lt` |
| `-S` | Sort by file **S**ize | S = Size (capital) | `ls -lS` |
| `-R` | **R**ecursive (list subdirectories) | R = Recursive (capital) | `ls -R` |
| `-i` | Show **i**node number | i = inode | `ls -i` |

**Best combo:** `ls -lah` → long + all + human readable

---

### `grep` — Search Text

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-r` | **R**ecursive search through dirs | r = recursive | `grep -r 'error' /var/log/` |
| `-i` | **I**gnore case | i = ignore | `grep -i 'Error' file` |
| `-n` | Show line **n**umbers | n = number | `grep -n 'TODO' file` |
| `-v` | In**v**ert match (non-matching lines) | v = versus/invert | `grep -v 'debug' file` |
| `-l` | **L**ist only filenames with matches | l = list files | `grep -rl 'TODO' .` |
| `-c` | **C**ount matching lines | c = count | `grep -c 'error' file` |
| `-w` | **W**hole word match only | w = whole word | `grep -w 'log' file` |
| `-A N` | Show N lines **A**fter match | A = After | `grep -A 3 'error'` |
| `-B N` | Show N lines **B**efore match | B = Before | `grep -B 2 'error'` |
| `-C N` | Show N lines **C**ontext (both sides) | C = Context | `grep -C 2 'error'` |
| `-E` | **E**xtended regex (use +, ?, \|) | E = Extended | `grep -E 'err\|warn'` |
| `-o` | Show **o**nly the matching part | o = only match | `grep -o '[0-9]*' file` |

**Best combos:**
```bash
grep -rn 'pattern' .        # recursive + line numbers
grep -ri 'pattern' .        # recursive + ignore case
grep -rni 'pattern' .       # all three combined
grep -v 'pattern' file      # show everything EXCEPT pattern
```

---

### `tar` — Archive Files

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-c` | **C**reate archive | c = create | `tar -cf out.tar dir/` |
| `-x` | E**x**tract archive | x = extract | `tar -xf out.tar` |
| `-z` | Compress with g**z**ip (.tar.gz) | z = zip/gzip | `tar -czf a.tar.gz` |
| `-j` | Compress with bzip2 (.tar.bz2) | j = bzip (odd one, memorize it) | `tar -cjf a.tar.bz2` |
| `-v` | **V**erbose (show files being processed) | v = verbose | `tar -czvf` |
| `-f` | Specify **f**ile name (always last!) | f = file | `tar -f archive.tar` |
| `-t` | Lis**t** contents without extracting | t = table of contents | `tar -tf a.tar.gz` |
| `-C` | **C**hange to directory before extracting | C = Change dir (capital) | `tar -xf a.tar -C /tmp` |
| `--exclude` | Exclude pattern from archive | self-explanatory | `tar -czf a.tar.gz --exclude='*.log' dir/` |

**Best combos:**
```bash
tar -czvf archive.tar.gz folder/    # CREATE gzip archive
tar -xzvf archive.tar.gz            # EXTRACT gzip archive
tar -tzvf archive.tar.gz            # LIST contents of archive
tar -xzvf archive.tar.gz -C /dest/ # extract to specific dir
```

> Memory for create vs extract: **C**reate → **C**ome together | e**X**tract → e**X**it

---

### `find` — Search Filesystem

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-name` | Match by filename | name = name | `find . -name '*.log'` |
| `-iname` | Match filename (case **i**nsensitive) | i = ignore case | `find . -iname '*.LOG'` |
| `-type` | Match by type (f=file, d=dir, l=link) | type = type | `find . -type f` |
| `-size` | Match by size (+100M = over 100MB) | size = size | `find / -size +1G` |
| `-mtime` | **M**odified **time** in days | m=modified t=time | `find . -mtime -7` |
| `-atime` | **A**ccessed **time** in days | a=accessed | `find . -atime +30` |
| `-user` | Files owned by user | user = user | `find / -user john` |
| `-perm` | Match by **perm**issions | perm = permissions | `find . -perm 644` |
| `-exec` | **Exec**ute command on each result | exec = execute | `find . -name '*.tmp' -exec rm {} \;` |
| `-maxdepth` | Limit directory depth | max = maximum | `find . -maxdepth 2` |
| `-not` | Negate condition | not = NOT | `find . -not -name '*.log'` |

**Key syntax:**
```bash
# + means more than, - means less than (for size/time)
find / -size +100M       # files LARGER than 100MB
find / -size -1k         # files SMALLER than 1KB
find . -mtime -7         # modified WITHIN last 7 days
find . -mtime +30        # modified MORE than 30 days ago

# Execute command on results
find . -name '*.log' -exec rm {} \;       # delete all .log files
find . -name '*.txt' -exec grep 'error' {} \;  # search inside files
```

---

### `curl` — Transfer Data

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-O` | Save with **O**riginal filename | O = Original (capital) | `curl -O https://x.com/file.zip` |
| `-o` | **O**utput to custom filename | o = output (lowercase) | `curl -o myfile.zip url` |
| `-X` | Set HTTP method (GET/POST/PUT/DELETE) | X = method (x marks it) | `curl -X POST url` |
| `-H` | Set **H**eader | H = Header | `curl -H 'Authorization: Bearer TOKEN' url` |
| `-d` | Send **d**ata (POST body) | d = data | `curl -d 'key=value' url` |
| `-s` | **S**ilent (no progress bar) | s = silent | `curl -s url` |
| `-L` | Follow **L**ocations (redirects) | L = Location | `curl -L url` |
| `-u` | **U**ser credentials | u = user | `curl -u user:pass url` |
| `-v` | **V**erbose (show request/response headers) | v = verbose | `curl -v url` |
| `-I` | Fetch headers only (**I**nspect) | I = Info/Inspect | `curl -I url` |
| `-k` | **K**eep going (ignore SSL errors) | k = keep (insecure) | `curl -k https://url` |
| `--limit-rate` | Limit download speed | self-explanatory | `curl --limit-rate 100k url` |

**Best combos:**
```bash
curl -sL url                          # silent + follow redirects
curl -X POST -H 'Content-Type: application/json' -d '{"key":"val"}' url
curl -O -L url                        # download with original name + follow redirect
curl -u user:pass -X GET url          # authenticated request
```

---

### `ssh` — Remote Login

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-p` | Custom **p**ort | p = port | `ssh -p 2222 user@host` |
| `-i` | **I**dentity file (private key) | i = identity | `ssh -i key.pem user@host` |
| `-L` | **L**ocal port forwarding | L = Local tunnel | `ssh -L 8080:host:80 user@host` |
| `-R` | **R**emote port forwarding | R = Remote tunnel | `ssh -R 80:local:8080 user@host` |
| `-N` | **N**o command (tunnel only, no shell) | N = No shell | `ssh -N -L 8080:host:80 user@host` |
| `-v` | **V**erbose debug output | v = verbose | `ssh -v user@host` |
| `-A` | **A**gent forwarding | A = Agent | `ssh -A user@host` |
| `-X` | X11 forwarding (GUI apps) | X = X11 | `ssh -X user@host` |
| `-T` | Disable pseudo-**t**erminal | T = Terminal off | `ssh -T git@github.com` |

---

### `chmod` — File Permissions

| Flag / Value | Meaning | Memory Trick | Example |
|-------------|---------|-------------|---------|
| `-R` | **R**ecursive | R = Recursive | `chmod -R 755 dir/` |
| `+x` | Add e**x**ecute permission | + adds, x = execute | `chmod +x script.sh` |
| `-x` | Remove execute | - removes | `chmod -x file` |
| `+r` | Add **r**ead | + adds, r = read | `chmod +r file` |
| `+w` | Add **w**rite | + adds, w = write | `chmod +w file` |

**Permission numbers (memorize these 4):**

```
Number breakdown:
  4 = read    (r)
  2 = write   (w)
  1 = execute (x)

  7 = 4+2+1 = rwx  (all permissions)
  6 = 4+2   = rw-  (read + write)
  5 = 4+1   = r-x  (read + execute)
  4 = 4     = r--  (read only)
  0 =       = ---  (no permissions)
```

| Value | Permissions | Who gets what | Use for |
|-------|------------|--------------|---------|
| `755` | rwxr-xr-x | Owner=all, Others=read+exec | Scripts, directories |
| `644` | rw-r--r-- | Owner=read+write, Others=read | Regular files, configs |
| `600` | rw------- | Owner only | SSH keys, passwords |
| `777` | rwxrwxrwx | Everyone can do everything | Avoid! Security risk |
| `700` | rwx------ | Owner only, with execute | Private scripts |

```bash
chmod 755 script.sh     # make script executable by all
chmod 644 config.txt    # owner can edit, others read-only
chmod 600 ~/.ssh/id_rsa # private key — owner only
chmod -R 755 /var/www   # recursive on directory
```

---

### `ps` — Process List

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `a` | **A**ll processes (not just yours) | a = all | `ps aux` |
| `u` | **U**ser-oriented format | u = user | `ps aux` |
| `x` | Processes without a terminal | x = extra (no tty) | `ps aux` |
| `-e` | **E**very process | e = every | `ps -ef` |
| `-f` | **F**ull format listing | f = full | `ps -ef` |
| `--forest` | Show parent/child tree | forest = tree | `ps aux --forest` |
| `--sort` | Sort by column | sort = sort | `ps aux --sort=-%mem` |

**Best combos:**
```bash
ps aux                      # full process list (most common)
ps aux | grep nginx         # find specific process
ps aux --sort=-%cpu         # sort by CPU usage (highest first)
ps aux --sort=-%mem         # sort by memory usage
ps -ef --forest             # show process tree
```

---

### `ss` — Socket Statistics (modern netstat)

| Flag | Meaning | Memory Trick | Example |
|------|---------|-------------|---------|
| `-t` | **T**CP sockets | t = tcp | `ss -t` |
| `-u` | **U**DP sockets | u = udp | `ss -u` |
| `-l` | **L**istening sockets | l = listening | `ss -l` |
| `-n` | **N**umeric (no DNS lookup) | n = numeric | `ss -n` |
| `-p` | Show **p**rocess using socket | p = process | `ss -p` |
| `-s` | **S**ummary statistics | s = summary | `ss -s` |

**The master combo:**
```bash
ss -tulnp
# t = tcp
# u = udp
# l = listening
# n = numeric
# p = process name
# = "Show all listening ports with process names"
```

---

### `systemctl` — Service Management

| Subcommand | Meaning | Example |
|-----------|---------|---------|
| `start` | Start a service | `systemctl start nginx` |
| `stop` | Stop a service | `systemctl stop nginx` |
| `restart` | Restart a service | `systemctl restart nginx` |
| `reload` | Reload config without restart | `systemctl reload nginx` |
| `status` | Show service status | `systemctl status nginx` |
| `enable` | Start at boot | `systemctl enable nginx` |
| `disable` | Don't start at boot | `systemctl disable nginx` |
| `is-active` | Check if running | `systemctl is-active nginx` |
| `list-units` | List all services | `systemctl list-units --type=service` |

---

### `sed` — Stream Editor

| Flag/Expression | Meaning | Memory Trick | Example |
|----------------|---------|-------------|---------|
| `-i` | Edit **i**n-place (modify file directly) | i = in-place | `sed -i 's/old/new/g' file` |
| `-n` | **N**o auto-print (use with p) | n = no output | `sed -n '5,10p' file` |
| `-e` | **E**xpression (multiple commands) | e = expression | `sed -e 's/a/b/' -e 's/c/d/'` |
| `s/old/new/` | **S**ubstitute first match | s = substitute | `sed 's/error/ERROR/' file` |
| `s/old/new/g` | Substitute **g**lobally (all matches) | g = global | `sed 's/error/ERROR/g' file` |
| `s/old/new/gi` | Global + **i**gnore case | g+i combo | `sed 's/error/ERROR/gi' file` |
| `Np` | Print line **N** | p = print | `sed -n '5p' file` |
| `N,Mp` | Print lines **N** to **M** | range | `sed -n '5,10p' file` |
| `/pattern/d` | **D**elete matching lines | d = delete | `sed '/error/d' file` |

---

### `awk` — Text Processing

| Feature | Meaning | Example |
|---------|---------|---------|
| `$1, $2...` | Column 1, 2... | `awk '{print $1}' file` |
| `$0` | Entire line | `awk '{print $0}' file` |
| `NR` | Line **N**umber of **R**ecord | `awk '{print NR, $0}' file` |
| `NF` | **N**umber of **F**ields (columns) | `awk '{print NF}' file` |
| `-F` | Set **F**ield delimiter | `awk -F',' '{print $2}' file` |
| `/pattern/` | Filter by pattern | `awk '/error/ {print}' file` |
| `BEGIN{}` | Run before processing | `awk 'BEGIN{print "start"}'` |
| `END{}` | Run after processing | `awk 'END{print NR" lines"}'` |

---

## 4. Flag Families (by what they control)

### Output Verbosity Family
```bash
-v        # verbose — show more detail (tar, rsync, curl, ssh, apt)
-vv       # very verbose — maximum detail (ssh, nmap)
-s        # silent — show nothing (curl, wget, apt)
-q        # quiet — minimal output (git, apt)
```

### Recursion Family
```bash
-r    # recursive — cp, grep, rm, rsync
-R    # Recursive — chmod, ls (capital for these two)
```
> Always needed when working with directories instead of single files

### User / Identity Family
```bash
-u username    # filter by user (ps, lsof, find)
-i keyfile     # identity / key file (ssh)
-u user:pass   # credentials (curl)
```
> `-u` means different things — context matters!

### Time and Interval Family
```bash
-t seconds      # timeout — stop after N seconds (read, ping, ssh)
-mtime -N       # modified in last N days (find)
-n interval     # repeat every N seconds (watch)
--since 'time'  # filter by time (journalctl)
```

### File Output Family
```bash
-o file    # output to custom file (curl, nmap, gcc)
-O         # save with original filename (curl, wget)
-w file    # write to file (tcpdump)
-f file    # specify archive file (tar)
>> file    # append to file (shell redirection)
```
> Capital `-O` = keep original filename

### Network Flags Family
```bash
-p port    # port number (ssh, nmap, nc)
-n         # no DNS lookup, show numeric IPs (ss, netstat, ping)
-t         # TCP only (ss, netstat)
-u         # UDP only (ss, netstat)
-l         # listening sockets (ss, netstat)
```

### Size and Count Family
```bash
-h         # human readable — KB/MB/GB (df, du, ls, free)
-s         # summary — total only (du)
-c         # count matches (grep, wc)
-l         # count lines (wc)
-w         # count words (wc)
```

### Safety Flags Family
```bash
-i           # interactive — ask before each action (rm -i, cp -i)
-f           # force — skip confirmation (rm -f, cp -f)
-n           # dry run — simulate only (rsync -n)
--dry-run    # simulate without making changes (rsync, apt)
```
> **Always use `-n` or `--dry-run` first when unsure!**

---

## 5. Most Useful Combos to Memorize

These are the combinations you will actually type every day.
Memorize these as complete units — not individual flags.

### Daily essentials
```bash
ls -lah                    # list all files with sizes and permissions
ps aux                     # see all running processes
ps aux | grep nginx        # find specific process
df -h                      # check disk space
du -sh *                   # see size of everything in current dir
free -h                    # check RAM usage
```

### Archive (tar)
```bash
tar -czvf archive.tar.gz folder/    # CREATE compressed archive
tar -xzvf archive.tar.gz            # EXTRACT compressed archive
tar -tzvf archive.tar.gz            # LIST contents (don't extract)
tar -xzvf archive.tar.gz -C /dest/ # extract to specific location
```

### Search (grep)
```bash
grep -rn 'pattern' .        # search recursively with line numbers
grep -ri 'pattern' .        # search recursively case-insensitive
grep -v 'pattern' file      # show everything EXCEPT pattern
grep -rn 'TODO' . --include='*.py'  # search only Python files
```

### Network (ss)
```bash
ss -tulnp                   # ALL listening ports with process names
ss -tulnp | grep :80        # who is using port 80
ss -s                       # connection summary
```

### Find files
```bash
find . -name '*.log' -mtime -7          # logs from last 7 days
find / -size +100M -type f              # files over 100MB
find . -name '*.tmp' -exec rm {} \;    # find and delete temp files
find /var/www -perm 777                 # find world-writable files
```

### rsync (always test with -n first!)
```bash
rsync -avzn src/ dest/          # DRY RUN first (simulate)
rsync -avz src/ dest/           # actual sync
rsync -avz --delete src/ dest/  # sync and delete extras in dest
rsync -avz src/ user@host:/path # sync to remote server
```

### sed one-liners
```bash
sed -i 's/old/new/g' file           # replace all in file
sed -i 's/old/new/g' *.conf         # replace in multiple files
sed -n '10,20p' file                # print lines 10-20
sed '/^#/d' file                    # remove comment lines
sed '/^$/d' file                    # remove empty lines
```

### awk one-liners
```bash
awk '{print $1}' file               # print first column
awk -F',' '{print $2}' file.csv    # print second column of CSV
awk '/error/ {print NR": "$0}'     # print line number + error lines
awk '{sum+=$1} END{print sum}'     # sum a column of numbers
ps aux | awk '{print $1, $11}'     # show user + process name
```

---

## 6. Quick Quiz — Test Yourself

Test your knowledge. Cover the answer and try to recall before revealing.

| Question | Answer |
|----------|--------|
| What does `grep -v` do? | Invert match — show lines that do NOT match |
| What flag makes `ls` show hidden files? | `-a` (all) |
| In `tar`, which flag CREATES an archive? | `-c` (create) |
| What does `-h` mean in `df -h`? | Human readable (shows KB/MB/GB) |
| What does `grep -r` do? | Recursive search through directories |
| In `curl`, what does `-X POST` do? | Sets the HTTP method to POST |
| What does `chmod 755` set? | rwxr-xr-x — owner=all, group/others=read+exec |
| What does `ps aux` show? | All processes with user info |
| What flag makes `rm` work on directories? | `-r` (recursive) |
| In `ssh`, what does `-i` specify? | Identity file (private key path) |
| What does `grep -n` add to output? | Line numbers |
| What does `tar -z` do? | Compress/decompress with gzip |
| What does `ss -l` show? | Listening sockets (open ports) |
| In `find`, what does `-mtime -7` mean? | Modified within the last 7 days |
| What does `curl -s` do? | Silent mode — no progress bar |
| What does `chmod +x` do? | Adds execute permission |
| What does `grep -i` do? | Ignore case in matching |
| In `du`, what does `-s` do? | Summary — one total per item |
| What does `sed -i` do? | Edit file in-place (modify directly) |
| What does `awk -F','` do? | Set field delimiter to comma (for CSV) |

---

## Cheat Sheet — One Page Summary

```
UNIVERSAL PATTERNS:
  -r/-R  recursive      -v  verbose       -f  force/file
  -h     human readable -n  numeric/count -i  ignore case/interactive
  -l     long/list      -a  all/archive   -o  output file
  -s     silent/summary -u  user/unique   -x  extract/exclude

TOP COMBOS:
  ls -lah               list all files nicely
  ps aux                all processes
  df -h                 disk space
  du -sh *              folder sizes
  free -h               RAM usage
  ss -tulnp             all open ports
  grep -rn 'x' .        search files recursively
  tar -czvf x.tar.gz .  create archive
  tar -xzvf x.tar.gz    extract archive
  find . -name '*.log'  find files
  sed -i 's/a/b/g' f    replace in file
  chmod 755 script.sh   make executable
  chmod 600 key.pem     private key perms

PERMISSION NUMBERS:
  7 = rwx  6 = rw-  5 = r-x  4 = r--  0 = ---
  755 = scripts    644 = files    600 = private

WHEN UNSURE:
  command --help        quick reference
  man command           full manual
  tldr command          simple examples
```

---

*Study tip: Don't memorize flags in isolation. Memorize the full combos you'll actually type (`ls -lah`, `ps aux`, `tar -czvf`). After typing them 10 times, they become muscle memory.*
