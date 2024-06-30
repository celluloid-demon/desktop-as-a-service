FROM fedora:40

# Merge system files and WSL configuration
COPY etc /
COPY usr /

# Add user
RUN useradd --create-home jonathan
RUN echo jonathan:password | chpasswd
RUN usermod -a -G wheel jonathan

# Merge user files and set permissions
COPY --chown=jonathan:jonathan home /
RUN su - jonathan -c ''

# Update
RUN dnf update -y

# Install packages
RUN dnf install -y flatpak firefox byobu gh git nano pv rsync tldr tree ncurses util-linux util-linux-user passwd vim wget @core sqlite pinentry cracklib-dicts
RUN dnf groupinstall -y "Development Tools" "Development Libraries"
RUN dnf groupinstall -y "Xfce Desktop"

# Configure rpmfusion
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf config-manager --enable fedora-cisco-openh264
RUN dnf install -y @core
RUN dnf swap -y ffmpeg-free ffmpeg --allowerasing
RUN sudo dnf install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
RUN dnf install -y @sound-and-video
RUN dnf install -y intel-media-driver
RUN dnf install -y rpmfusion-free-release-tainted
RUN dnf install -y libdvdcss
RUN sudo dnf install -y rpmfusion-nonfree-release-tainted
RUN sudo dnf --repo=rpmfusion-nonfree-tainted install -y "*-firmware"

# Configure flatpak
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install google chrome
# Source: https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
RUN dnf install -y fedora-workstation-repositories
RUN dnf config-manager --set-enabled google-chrome
RUN dnf install -y google-chrome-stable

# Configure git
RUN git config --global user.name  jonathan
RUN git config --global user.email celluloid-demon@users.noreply.github.com
RUN su - jonathan -c 'mkdir -p ${HOME}/Applications'
RUN su - jonathan -c 'mkdir -p ${HOME}/Desktop'
RUN su - jonathan -c 'mkdir -p ${HOME}/git'

# Download rsync-helper-scripts (installation requires SystemD / WSL)
RUN su - jonathan -c 'cd ${HOME}/Desktop && git clone "https://www.github.com/celluloid-demon/rsync-helper-scripts"'

# Install yt-dlp
RUN su - jonathan -c 'mkdir -p ${HOME}/.local/bin'
RUN su - jonathan -c 'curl -L "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp" -o "${HOME}/.local/bin/yt-dlp"'
RUN su - jonathan -c 'chmod a+rx ${HOME}/.local/bin/yt-dlp'

# Install shared-config-nix
RUN su - jonathan -c 'cd ${HOME}/Applications && git clone "https://www.github.com/celluloid-demon/shared-config-nix"'
RUN su - jonathan -c 'mkdir -p ${HOME}/.bashrc.d'
RUN su - jonathan -c 'ln -s Applications/shared-config-nix/home/bin bin'
RUN su - jonathan -c 'ln -s Applications/shared-config-nix/home/usr usr'
RUN su - jonathan -c 'ln -s ${HOME}/Applications/shared-config-nix/dot-files/bash_aliases .bashrc.d/bash_aliases'

# Install Discord
RUN su - jonathan -c 'mkdir -p ${HOME}/Downloads'
RUN su - jonathan -c 'wget -O "${HOME}/Downloads/discord.tar.gz" "https://discord.com/api/download?platform=linux&format=tar.gz"'
RUN su - jonathan -c 'tar -xvzf ${HOME}/Downloads/discord.tar.gz -C ${HOME}/Applications/'
RUN su - jonathan -c 'mkdir -p ${HOME}/.local/share/applications'
RUN su - jonathan -c 'cp ${HOME}/Applications/Discord/discord.desktop ${HOME}/.local/share/applications/'
RUN su - jonathan -c 'sed -i "s|^Exec=.*|Exec=${HOME}/Applications/Discord/Discord|g"     ${HOME}/.local/share/applications/discord.desktop'
RUN su - jonathan -c 'sed -i "s|^Icon=.*|Icon=${HOME}/Applications/Discord/discord.png|g" ${HOME}/.local/share/applications/discord.desktop'

# Configure ssh
RUN su - jonathan -c 'mkdir -p ${HOME}/.filepacks/@ssh'
RUN su - jonathan -c 'ln -s ${HOME}/.filepacks/@ssh ${HOME}/.ssh'















