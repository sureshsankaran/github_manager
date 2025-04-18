#!/bin/bash

# Set up GitHub token for authentication
if [ -n "$GITHUB_TOKEN" ]; then
    echo "machine github.com login $GIT_USER_NAME password $GITHUB_TOKEN" > ~/.netrc
    chmod 600 ~/.netrc
fi
git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME
git config --global init.defaultBranch master
# Execute the command passed to the container (e.g., /bin/bash)
exec "$@"
