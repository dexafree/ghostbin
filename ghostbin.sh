#!/bin/sh
if [ ! -f /data/expiry.gob ]; then
    touch /data/expiry.gob
    chown ghostbin:ghostbin /data/expiry.gob
fi
sudo -E -u ghostbin /ghostbin/go/src/github.com/DHowett/ghostbin/ghostbin -addr="0.0.0.0:8619" -log_dir="/logs" -root="/data"
