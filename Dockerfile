FROM opencog/opencog-deps

ARG EXT_UID=2001
ARG EXT_GID=2001
ARG USERNAME=opencog
ARG GROUPNAME=opencog

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

COPY --chown=opencog:opencog .bashrc /home/$USERNAME/.bashrc
COPY --chown=opencog:opencog .gdbinit /home/$USERNAME/.gdbinit
