#!/bin/sh

if [ -e ~/.ssh/id_ed25519 ]; then
	echo "SSH key found. Skipping key generation."
else
	echo "No SSH key found. Generating key..."
	ssh-keygen -t ed25519 -a 100
fi
