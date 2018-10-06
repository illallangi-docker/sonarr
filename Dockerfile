FROM illallangi/ansible:latest as image
ENV SONARR_VERSION 2.0.0.5228
ENV SONARR_SHA256 81b79e9de22b43cd5866cf0927240fad8c5f1337fa2b9c5c0ab67dbc2335da5b
COPY image/* /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

ENV UID=1024
ENV USER=sonarr
COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/sonarr-entrypoint.sh"]
