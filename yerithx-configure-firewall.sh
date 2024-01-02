#!/bin/sh

sudo ufw default allow outgoing

sudo ufw default deny incoming

sudo ufw enable
