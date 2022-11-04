# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install V
RUN mkdir /opt/v \
    && (cd /opt/v \
        && git init \
        && git remote add origin https://github.com/vlang/v.git \
        && git fetch --depth=1 origin 54b623743d12306aac8d0091daf3149299d5fe9e \
        && git reset --hard FETCH_HEAD \
        && make \
        && ./v symlink \
		&& chown -R 1000:1000 .)

