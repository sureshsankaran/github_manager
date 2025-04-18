
# Create a new private GitHub repo from current directory
# add repo to remote (master branch)
gnew() {
  git init
  gh repo create $1 --public
  git remote add origin https://github.com/sureshsankaran/"$1".git
}

# Clone a GitHub repo
gclone() {
  gh repo clone "$1"
}

# Add files or directories
ga() {
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

