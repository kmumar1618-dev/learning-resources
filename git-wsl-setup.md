# Git + WSL Setup Notes (learning-resources)

## Situation

* Repository was originally cloned in Windows:

  * `C:\Users\ZS\Documents\git\learning-resources`
* Started using Ubuntu via WSL.
* GitHub account already existed.
* Goal: work with the same GitHub repository from WSL.

---

# 1. Verify Git Installation

Check that Git is installed and accessible.

```bash
git --version
```

---

# 2. Navigate to Existing Repository

```bash
cd /mnt/c/users/ZS/documents/git/learning-resources
```

Check repository status:

```bash
git status
```

---

# 3. Dubious Ownership Error

Error:

```text
fatal: detected dubious ownership in repository
```

Cause:

* Repository owned through Windows.
* WSL Git considered ownership unsafe.

Fix:

```bash
git config --global --add safe.directory /mnt/c/users/ZS/documents/git/learning-resources
```

Verify:

```bash
git status
```

---

# 4. Verify Git Identity

Check configured username and email:

```bash
git config --global user.name
git config --global user.email
```

Set if needed:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

---

# 5. Check Repository Remote

Display configured remote:

```bash
git remote -v
```

Current remote was:

```text
https://github.com/repo-id/learning-resources.git
```

---

# 6. Test GitHub SSH Authentication

Test SSH connection:

```bash
ssh -T git@github.com
```

First connection:

```text
Are you sure you want to continue connecting?
```

Accept:

```text
yes
```

Successful authentication message:

```text
You've successfully authenticated, but GitHub does not provide shell access.
```

Meaning:

* SSH key is correctly configured.
* GitHub recognizes the account.

---

# 7. Permission Problem on Windows Drive

Attempting Git operations on:

```text
produced errors such as:

```text
config.lock failed: Operation not permitted
```

and

```text
fatal: could not set 'core.filemode'
```

Cause:

* WSL had issues creating Git lock files on the Windows-mounted filesystem.

---

# 8. Inspect Repository Configuration

View Git configuration:

```bash
cat .git/config
```

Inspect permissions:

```bash
ls -ld .git
ls -l .git/config
```

---

# 9. Final Working Solution

Do NOT work from:

```text
```

Create a Linux workspace:

```bash
cd ~

mkdir git

cd git
```

Clone repository into Linux filesystem:

```bash
git clone git@github.com:kmumar1618-dev/learning-resources.git
```

Result:

```text
```

Benefits:

* No Windows permission issues.
* Git works normally.
* SSH authentication works.
* Faster and more reliable in WSL.

---

# 10. Verify Repository

```bash

git status
```

Expected:

```text
On branch main
Your branch is up to date with 'origin/main'.
```

---

# 11. Access WSL Files from Windows

Open WSL filesystem:

```text
\\wsl$
```

Repository location:

```text
```

Open current Linux folder in Windows Explorer:

```bash
explorer.exe .
```

---

# Useful Commands Summary

```bash
git --version

git status

git remote -v

git config --global user.name

git config --global user.email

git config --global --add safe.directory /mnt/c/users/ZS/documents/git/learning-resources

ssh -T git@github.com

cat .git/config

ls -ld .git

ls -l .git/config

git clone git@github.com:kmumar1618-dev/learning-resources.git

explorer.exe .
```

---

# Key Lesson

For WSL development:

✅ Keep Git repositories inside:

```text
/home/<user>/...
```

❌ Avoid active Git work inside:

```text
/mnt/c/...
```

This prevents Git permission and lock-file problems.
