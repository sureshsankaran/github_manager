
ginit() {
  git config --global $GIT_USER_EMAIL
  git config --global user.name $GIT_USER_NAME
  git config --global init.defaultBranch master
}
# Create a new private GitHub repo from current directory
# add repo to remote (master branch)
gnew() {
  git init
  gh repo create $1 --public
  git remote add origin https://github.com/sureshsankaran/"$1".git
  cat ".*" > .gitignore
}

# Clone a GitHub repo
gclone() {
  gh repo clone "$1"
}

# Add files or directories
ga() {
  echo "WARNING: check if there are any files to to add to .gitignore for private data"
  git add .
}

# Commit with a message
gc() {
  git commit -m "$1"
}

gl() {
  git log
}

gremote() {
  git remote -v
}

# Push to a branch
gpush() {
  echo "WARNING: check if there are any files to to add to .gitignore for private data"
  ga
  gc "$1"
  git push origin "`git branch --show-current`"
}

# Pull from a branch
gpull() {
  git pull origin "$1"
}

# Checkout a branch
gco() {
  git checkout "$1"
}

# Create a pull request
ghpr() {
  gh pr create --base "$1" --head "$2" --title "$3" --body "$4"
}

# Merge a pull request
ghprm() {
  gh pr merge "$1" --merge
}



# Merge a branch
gm() {
  git merge "$1"
}
ginit

