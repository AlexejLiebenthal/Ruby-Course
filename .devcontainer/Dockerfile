# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6
ARG VARIANT="3.0"
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install fish

# [Optional] Uncomment this line to install additional gems.
RUN gem install solargraph rails

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# Install and configure `fish` and `omf`
RUN su vscode -c \
    "curl -L https://get.oh-my.fish | fish && \
    sudo curl -fsSLO https://starship.rs/install.sh && sudo sh ./install.sh --yes && sudo rm install.sh && \
    echo 'starship init fish | source' >> ~/.config/fish/config.fish && \
    fish -c 'omf install kill-on-port z https://github.com/jorgebucaran/autopair.fish'"
