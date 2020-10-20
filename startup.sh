#!/bin/sh

if [ "$SSH_ROOT_PASSWORD" == "" ]; then
    echo "SSH_ROOT_PASSWORD is required"
    exit 1
fi

if [ ! -f /done-sshd ]; then
    echo "Setting root password to ${SSH_ROOT_PASSWORD}..."
    echo "root:${SSH_ROOT_PASSWORD}" |chpasswd
    touch /done-sshd
    echo "Creating SSH keys..."
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi

echo "Run sshd server..."
/usr/sbin/sshd

echo "Starting mongoexpress..."
/docker-entrypoint.sh mongo-express
