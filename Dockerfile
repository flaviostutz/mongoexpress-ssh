FROM mongo-express:0.54.0

RUN apk add openssh bash
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=3.4.4-r0

ENV SSH_ROOT_PASSWORD ''

ADD startup.sh /
ADD sshd_config /etc/ssh/

ENTRYPOINT [ "/startup.sh" ]
