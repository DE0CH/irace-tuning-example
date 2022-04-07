FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get install ubuntu-server -y
RUN apt-get install build-essential -y

ARG UNAME=ubuntu
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} ${UNAME}
RUN useradd -m -u ${UID} -g ${GID} -s /bin/bash ${UNAME}
RUN echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

USER $UNAME
WORKDIR /home/${UNAME}
RUN git clone https://github.com/Homebrew/brew .linuxbrew
RUN eval "$(.linuxbrew/bin/brew shellenv)"
RUN .linuxbrew/bin/brew update --force --quiet
ENV PATH="/home/${UNAME}/.linuxbrew/bin:${PATH}"
RUN echo $PATH

RUN brew install gcc
RUN brew install R
RUN rscript -e 'install.packages("irace", repos = "http://cran.us.r-project.org")'
RUN export IRACE_HOME=$(rscript -e 'cat(system.file(package="irace", "bin", mustWork=TRUE))')
ENV PATH="${IRACE_HOME}:${PATH}"