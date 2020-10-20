FROM mongo-express:0.54.0

RUN apk add openssh bash

ENV SSH_ROOT_PASSWORD ''

ADD startup.sh /
ADD sshd_config /etc/ssh/

ENTRYPOINT [ "/startup.sh" ]
