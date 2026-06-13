touch {git,ripgrep,vim}.md
git config --global core.autocrlf false
git config --get core.autocrlf
git config --get core.autocrlf
touch .gitattributes
*.md text eol=lf
git add --renormalize .
git config --global --list

