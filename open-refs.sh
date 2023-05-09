#!/bin/bash

cd /home/bob/.bibmanager
nohup emacs . --geometry 220x40+0-0 -f split-window-horizontally -f neotree &
