if [ "$1" = "-b" ]; then
  docker build -t github-manager .
fi


docker run -it --rm \
  -e GIT_USER_NAME="$GIT_USER_NAME" \
  -e GIT_USER_EMAIL="$GIT_USER_EMAIL" \
  -e GITHUB_TOKEN=$GITHUB_TOKEN \
  -v $(pwd)/repos:/repos \
  --name github-container \
  github-manager
