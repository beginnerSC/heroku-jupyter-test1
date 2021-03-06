FROM python:3.8-buster
MAINTAINER Team Notebooks AI <team@notebooks.ai>

# Supress warnings about missing front-end. As recommended at:
# http://stackoverflow.com/questions/22466255/is-it-possibe-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

RUN printf "\n\n" >> /etc/apt/sources.list
RUN echo '###### Debian Main Repos\n\
  deb http://deb.debian.org/debian/ oldstable main contrib non-free\n\
  deb-src http://deb.debian.org/debian/ oldstable main contrib non-free\n\
  deb http://deb.debian.org/debian-security oldstable/updates main\n\
  deb-src http://deb.debian.org/debian-security oldstable/updates main' >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y apt-file apt-utils && \
    apt-file update && \
    apt-get install -y vim unzip openssh-client curl pandoc xzdec libmpc-dev && \
    apt-get build-dep -y python-lxml

# Install bash-completion
RUN apt-get install bash-completion
RUN echo "source /etc/bash_completion\n" >> /root/.bashrc

# Install NodeJS
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && nvm install stable"

RUN echo "printf 'Happy hacking ❤️  Notebooks AI Team'" >> /root/.bashrc
RUN echo "printf '\n\n'" >> /root/.bashrc
RUN echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '" >> /root/.bashrc

RUN apt-get update && apt-get install -y --no-install-recommends \
#     texlive-fonts-recommended \
#     texlive-generic-recommended \
#     texlive-latex-base \
#     texlive-latex-extra \
#     texlive-latex-recommended \
#     texlive-publishers \
#     texlive-science \
#     texlive-xetex \
#     texlive-lang-chinese \
    tree \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["./scripts/postBuild.sh"]
CMD ["jupyter", "lab", "--config", "./jupyter_notebook_config.py"]