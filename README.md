# xvpnsmart
Rotate automatically through a list of ExpressVPN servers

There are two parts to this script. The script itself and a text file with a list of VPN servers you want to use. You can alos use only recommended servers or all available ones throughout the globe.

You can get the list of recommended servers by typing "expressvpn list". You get the complete list with "expressvpn list all"

I have my list in /etc/expressvpn_EU_list.conf and it's a copy/paste of the previous commands, one server per line. You should put the servers you want to rotate through in this file, preferably not to far from your location.

The script will shuffle through your list and never use the same order. Not much, but it makes it one level more difficult to guess what server you're hopping on next.

Let the script run from cron and it's going to hop at the set hour. One disclaimer, wget doesn't like the hopping. If you're hoarding with wget it'll stall the download.
