# permanent bash aliases
# Ubuntu loads  ~/.bash_aliases, so, create as a symbolic link to this file

#------------------------------------------------------------------------------
# 12 useful bash aliases that can make you more productive in linux
# https://www.lostsaloon.com/technology/12-useful-bash-aliases-that-you-can-make-you-more-productive-in-linux/

alias lh='ls -lisAd .[^.]*' # Print only hidden files.
alias la='ls -lisA'         # Detailed print.

alias cp='cp -iv'           # Safe copy.
alias rm='rm -iv'           # Safe remove.
#alias rm='rm -Iv'           # Safe remove (less intrusive).
alias mv='mv -iv'           # Safe move.
alias rms='shred -uz'       # Remove file.

#alias mkdir='mkdir -pv'    # Make folder and its parents.
alias hs='history|grep -i ' # Case insensitive search in history.
alias tgz='tar -xvzf'       # Untar.
alias ff='find . -type f -iname' # Search file by name

# alias mvn='nice -5 mvn'
# alias emerge='nice -10 emerge'
# alias rd='rdesktop -z -g 1600x1024 -d mydev -u tom' # Usage: $ rd remotemachine
# alias rs='rsync -avz --progress --delete-after'

alias cd..="cd .."           # Avoid typo.
alias pdw="pwd"              # Avoid typo.
alias pwd='pwd && pwd | xclip -sel clipboard' # Do pwd and copy it!


#------------------------------------------------------------------------------
# Linux essentials https://youtu.be/Ok_kD_sgNcs

# Speed test
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"         

alias lsmount="mount | column -t" # Pretty print mounted partitions 
alias extip="curl icanhazip.com"  # Print my external ip address.
alias mem5="ps auxf | sort -nr -k 4 | head -5" # Top 5 processes using the most memory.
alias cpu5="ps auxf | sort -nr -k 3 | head -5" # Top t processes using the most cpu.

#------------------------------------------------------------------------------
# Deprecated linux commands you should not use anymore (and their alternatives)
# https://itsfoss.com/deprecated-linux-commands/
alias      arp="echo 'STOP. Use instead ip n'"
alias    egrep="echo 'STOP. Use instead grep -E'"
alias    fgrep="echo 'STOP. Use instead grep -F'"
alias ifconfig="echo 'STOP. Use instead ip'"
alias iptables="echo 'STOP. Use instead nftables'"
alias iptunnel="echo 'STOP. Use instead ip link'"
alias iwconfig="echo 'STOP. Use instead iw'"
alias   nameif="echo 'STOP. Use instead ip route'"
alias  netstat="echo 'STOP. Use instead ss'"
alias    route="echo 'STOP. Use instead ip tunnel'"
alias      scp="echo 'STOP. Use instead rsync'"

#------------------------------------------------------------------------------
alias thesaurus="aiksaurus"

# https://opensource.com/article/23/2/linux-dict-command
# https://www.xmodulo.com/how-to-look-up-dictionary-via-command-line-on-linux.html
# dict-freedict-spa-eng
# dict-freedict-por-eng
# dict-freedict-deu-eng
alias dictionary="dict"
alias diccionario="dict -d fd-spa-eng"
alias dicionario="dict -d fd-por-eng"
alias worterbuch="dict -d fd-deu-eng"

# https://www.tecmint.com/wikipedia-commandline-tool/ # NOTE: It requies nodejs
#alias wikipedia="wikit"
alias wikipedia="wikipedia2text -s" # NOTE: It also requires w3m!

# Fun shell commands
# https://youtu.be/peyx6LXk2rk
alias translate="trans"
alias weather="curl wttr.in/Sao+Jose+dos+Campos?n"

alias password="keepassxc-cli open ~/passdb.kdbx "
alias password_find="keepassxc-cli search ~/passdb.kdbx "
alias password_search=password_find
alias password_copy="keepassxc-cli clip  ~/passdb.kdbx "
alias password_show="keepassxc-cli show ~/passdb.kdbx "

alias periodic_table="periodic-table-cli"


alias volume_low="amixer sset 'Master' 30%"
alias volume_medium="amixer sset 'Master' 50%"
alias volume_high="amixer sset 'Master' 80%"

alias explorer="nemo " # Linux Mint
#alias files="nemo "
alias files="ranger"

alias gato="oneko"
alias perro="oneko -dog"
alias sakura="oneko -sakura"
alias tomoyo="oneko -tomoyo"
alias tigre="oneko -tora"

alias anime="~/Documents/github/ani-cli/./ani-cli"

alias docker="podman"

# Listen to the lofi girl on youtube.
alias lofi="mpv --cache=auto --fs https://www.youtube.com/watch?v=jfKfPfyJRdk"

alias radio_chillsynth="echo 'Reduce volume!'; cdown 4; mpv --cache=auto https://stream.nightride.fm/chillsynth.mp3"
alias radio_chillout="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://strm112.1.fm/chilloutlounge_mobile_mp3"
alias radio_darksynth="echo 'Reduce volume!'; cdown 4; mpv --cache=auto https://stream.nightride.fm/darksynth.mp3"
alias radio_horrorsynth="echo 'Reduce volume!'; cdown 4; mpv --cache=auto https://stream.nightride.fm/horrorsynth.mp3"
alias radio_metal_denmark="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://46.4.184.212:8000/;"
alias radio_metal_france="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://hd.lagrosseradio.info/lagrosseradio-metal-192.mp3"
alias radio_metal_germany="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://s8-webradio.rockantenne.de/heavy-metal"
alias radio_metal_poland="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://stream.open.fm/108"
alias radio_metal_usa="echo 'Reduce volume!'; cdown 4; mpv --cache=auto https://ice5.somafm.com/metal-128-aac"
alias radio_radionica="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://shoutcast.rtvc.gov.co:8010/;"
alias radio_synthwave="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://188.40.97.185:8179/stream"
alias radio_ud="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://200.69.103.69:8000/laud"

alias youtube="ytfzf" # Install it from github!
alias youtube_img="ytfzf -t"
alias youtube_subs="ytfzf -cSI" 

alias rss="newsboat"

alias git_gui="lazygit"

alias gapminder="~/Documents/software/appimage/Gapminder+Offline.AppImage"

alias calendar="calcurse"
