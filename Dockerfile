# Use a lightweight base image with Git pre-installed
FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
    git \
    bash \
    curl
RUN apk add --no-cache github-cli \
     openssh-client
# Set working directory
WORKDIR /repos

# Copy a script to configure Git (optional)
COPY entrypoint.sh /entrypoint.sh
COPY .bashrc /root/.bashrc

RUN chmod +x /entrypoint.sh

# Set entrypoint to the script or a shell
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

