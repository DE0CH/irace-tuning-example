FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get install -y r-base
RUN rscript -e 'install.packages("irace", repos = "http://cran.us.r-project.org")'
RUN export IRACE_HOME=$(rscript -e 'cat(system.file(package="irace", "bin", mustWork=TRUE))')
ENV PATH="${IRACE_HOME}:${PATH}"

# Make user
ARG UNAME=ubuntu
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
