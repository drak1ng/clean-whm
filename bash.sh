#!/usr/bin/env bash

for f in /home/*; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        du -sh $f/mail/cur/*
        du -sh $f/mail/new/*
        du -sh $f/mail/.spam/*
        du -sh $f/logs/*
    fi
done

/scripts/generate_maildirsize --allaccounts --confirm --verbose
/scripts/fixquotas
