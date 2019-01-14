FROM opencog/opencog-deps

ENV PGHOST localhost
ENV PGUSER opencog_test
ENV PGPASSWORD cheese

RUN addgroup --gid 2001 vital
RUN adduser --disabled-password --gecos '' --uid 2001 --gid 2001 --shell /bin/bash vital
RUN adduser vital sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER vital
WORKDIR /home/vital

COPY --chown=vital:vital .bashrc /home/vital/.bashrc
