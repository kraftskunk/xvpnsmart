#!/bin/bash
#
# ----------------------------------------------------------------
#
# (c) 2020 Zoran Grbic
# Grbic Consulting
# support@bakkup.tech
#
# Based on script from Ubuntu Man
# (c) 2017 https://ubuntu101.co.za/security/vpn/expressvpn-automate-connection-switching-linux/?unapproved=3533&moderation-hash=7b859fd4d36aa4fa0e6c40509a2edaa9#comment-3533
#
# Connect to a different vpn every n-minutes, depending on crontab
# entry
#
# Script has been edited for and tested on Debian Buster
# All commands shuffle the servers around.
# This makes it difficult to know where you will hop to next.
#
# How to use:
#
# 1/ Copy the original script to /usr/local/sbin
# 2/ Create text file with list of servers either with
#
#   expressvpn list (for recommended servers)
#
# or
#
#   expressvpn list all (for all available servers)
#
# 3/ chose the ones you want to use
# 4/ copy/paste in your text file
# 5/ save to preferably /etc
# 6/ run script from cron
#
# ----------------------------------------------------------------

expressvpn disconnect
expressvpn refresh

# This will make you hop all over the world
# --
#VPN=$(expressvpn list all | tail -n +4 | awk '{ print $1 }' | shuf -n 1)

# This will make you hop around using recommended connections
# --
#VPN=$(expressvpn list all | grep '\Y$' | tail -n +5 | awk '{ print $1 }' | shuf -n 1)

# This will use a pre generated list as input
# --
VPNLIST=/etc/expressvpn_list.conf 
VPN=$(cat ${VPNLIST} | tail -n +4 | awk '{ print $1 }' | shuf -n 1)

expressvpn connect $VPN
