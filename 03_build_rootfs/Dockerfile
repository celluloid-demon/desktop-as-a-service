FROM fedora:40

# Flash custom files
COPY ./resources/dnf.conf /etc/dnf/

# Update
RUN dnf update -y

# Original package list
RUN dnf install -y ncurses util-linux util-linux-user passwd nano vim git gh wget @core sqlite pinentry cracklib-dicts

# Install XFCE
RUN dnf groupinstall -y "Xfce Desktop"
