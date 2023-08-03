FROM golang:1.20

ARG USER
ARG UID=1000
RUN useradd -ms /bin/bash ${USER} -u ${UID}

USER ${USER}

ENV HOME=/home/${USER}