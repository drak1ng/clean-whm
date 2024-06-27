#!/usr/bin/env bash

find /home -name "error_log" -type f -delete

for f in /home/*; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        rm -rf $f/mail/cur/*
        rm -rf $f/mail/new/*
        rm -rf $f/mail/.spam/*
        rm -rf $f/logs/*
    fi
done

/scripts/generate_maildirsize --allaccounts --confirm --verbose
/scripts/fixquotas
