git config --global user.name "Your Name"
git config --global user.email "Your Email"
touch {git,ripgrep,vim}.md
git config --global core.autocrlf false
git config --get core.autocrlf
git config --get core.autocrlf
touch .gitattributes
*.md text eol=lf
git add --renormalize .
git config --global --list
git checkout -b branch-name
git --help
git remote -v
ssh-keygen -t ed25519 -C "your-email@example.com"
press enter for all prompts
start the ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
show the public key
cat ~/.ssh/id_ed25519.pub
Copy the entire output.
In GitHub:
Click your profile picture → Settings
SSH and GPG keys
New SSH key
Paste the key and save
ssh -T git@github.com		test
it is not github permission problem instead wsl file permission problem
chmod on .../.git/config.lock failed: Operation not permitted
ls -ld .git
ls -l .git/config
mount | grep "/mnt/c"
Since this repository already exists on GitHub and SSH authentication is working, you can avoid the Windows 
permission mess by cloning it directly into your Linux home directory:
cd ~

git clone git@github.com:YOUR_USERNAME/learning-resources.git
~/learning-resources
\\wsl$		to browse to wsl installed git is stored here through ubuntu
then home, kmumar, ubuntu, git  and there are all your cloned repos

kmumar@DESKTOP-0VHBC98:~/git/Python$ pwd
remote -v/home/kmumar/git/Python
kmumar@DESKTOP-0VHBC98:~/git/Python$ git remote -v
origin  https://github.com/kmumar1618-dev/Python.git (fetch)
origin  https://github.com/kmumar1618-dev/Python.git (push)
kmumar@DESKTOP-0VHBC98:~/git/Python$ git remote set-url origin git@github.com:kmumar1618-dev/Python.git
kmumar@DESKTOP-0VHBC98:~/git/Python$ git remote -v
origin  git@github.com:kmumar1618-dev/Python.git (fetch)
origin  git@github.com:kmumar1618-dev/Python.git (push)
kmumar@DESKTOP-0VHBC98:~/git/Python$ git status


