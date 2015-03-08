############################################################
# Dockerfile to build OhMyZsh container images
# Based on Latest CentOS
############################################################

# Set the base image to CentOS
FROM centos

# File Author / Maintainer
MAINTAINER Ben Withem

ENV HOME /root
RUN yum update
RUN yum --nogpg install -y zsh git tmux

################## BEGIN INSTALLATION ######################
RUN git clone git://github.com/bwithem/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh
RUN sed -i -E "s/^plugins=\((.*)\)$/plugins=(\1 tmux)/" ~/.zshrc
WORKDIR /root
CMD ["zsh"]
