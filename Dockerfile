FROM opencog/opencog-deps

ARG EXT_UID=2001
ARG EXT_GID=2001
ARG USERNAME=vital
ARG GROUPNAME=vital

ENV PGHOST localhost
ENV PGUSER opencog_test
ENV PGPASSWORD cheese

RUN if ! id -u $USERNAME; then \
        addgroup --gid $EXT_GID $GROUPNAME; \
        adduser --disabled-password --gecos '' --uid $EXT_UID --gid $EXT_GID --shell /bin/bash $USERNAME; \
    fi

RUN adduser $USERNAME sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

COPY --chown=vital:vital .bashrc /home/$USERNAME/.bashrc
COPY --chown=vital:vital .gdbinit /home/$USERNAME/.gdbinit
