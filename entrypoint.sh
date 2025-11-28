#!/bin/sh
set -e

# Create users if they don't exist
id user 2>/dev/null || useradd -m -s /bin/bash user
id anonymous 2>/dev/null || useradd -m -s /bin/bash anonymous

# Set passwords (optional)
echo "user:123456" | chpasswd

exec "$@"
