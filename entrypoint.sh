#!/bin/sh
set -e

# Create users
id user 2>/dev/null || useradd -m -s /bin/bash user
id anonymous 2>/dev/null || useradd -m -s /bin/bash anonymous

# Set password
echo "user:123456" | chpasswd

usermod -aG sudo user

touch /etc/sudoers.d/deny-anonymous

echo "anonymous ALL=(ALL) NOPASSWD: /usr/bin/false
Defaults:anonymous !authenticate
" > /etc/sudoers.d/deny-anonymous
chmod 440 /etc/sudoers.d/deny-anonymous

gpasswd -d anonymous sudo 2>/dev/null || true

exec "$@"
