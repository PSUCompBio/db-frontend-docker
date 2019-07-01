FROM ubuntu:18.04
ARG UNAMEX=ubuntu
RUN echo "'UNAMEX=${UNAMEX}'"

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y git apt-utils

# Setup home environment
RUN useradd ${UNAMEX}

# below does not need to be done since on AWS ubuntu instances
# ubuntu user is added by default
# it could be useful if we change user name
#RUN mkdir /home/${UNAMEX} && chown -R ${UNAMEX}: /home/${UNAMEX}

WORKDIR /home/${UNAMEX}
ENV HOME /home/${UNAMEX}
RUN touch /home/${UNAMEX}/.bash_profile
RUN chown -R ${UNAMEX} /home/${UNAMEX}

RUN cd /home/${UNAMEX}
RUN pwd
COPY bash_scripts /home/${UNAMEX}/bash_scripts
COPY TestingProcedures.md /home/${UNAMEX}
RUN ls -ltr
#RUN /bin/bash config_bash.sh
RUN /bin/bash bash_scripts/inital-setup.sh
RUN /bin/bash bash_scripts/install-swig.sh
RUN /bin/bash bash_scripts/install-vtk-src.sh
RUN /bin/bash bash_scripts/install-mergepolydata.sh
RUN /bin/bash bash_scripts/install-complete.sh

# clean up and setup
COPY bash_scripts/bashrc /home/${UNAMEX}/.bashrc
RUN /bin/bash -c "source .bashrc"
RUN chown -R ${UNAMEX} /home/${UNAMEX}
