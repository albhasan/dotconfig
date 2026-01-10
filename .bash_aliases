# permanent bash aliases
# Ubuntu loads  ~/.bash_aliases, so, create as a symbolic link to this file

#------------------------------------------------------------------------------
# 12 useful bash aliases that can make you more productive in linux
# https://www.lostsaloon.com/technology/12-useful-bash-aliases-that-you-can-make-you-more-productive-in-linux/

alias cd..="cd .."                            # Avoid typo.
alias cp='cp -iv'                             # Safe copy.
alias la='ls -lisA'                           # Detailed print.
alias lh='ls -lisAd .[^.]*'                   # Print only hidden files.
alias ff='find . -type f -iname'              # Search file by name
alias hs='history|grep -i '                   # Case insensitive search in history.
alias lsmount="mount | column -t"             # Pretty print mounted partitions
alias mv='mv -iv'                             # Safe move.
alias pdw="pwd"                               # Avoid typo.
alias pwd='pwd && pwd | xclip -sel clipboard' # Do pwd and copy it!
alias rm='rm -iv'                             # Safe remove.
alias rms='shred -uz'                         # Remove file.
alias tgz='tar -xvzf'                         # Untar.
alias sduo=sudo

# alias mkdir='mkdir -pv'    # Make folder and its parents.
# alias mvn='nice -5 mvn'
# alias emerge='nice -10 emerge'
# alias rd='rdesktop -z -g 1600x1024 -d mydev -u tom' # Usage: $ rd remotemachine
# alias rs='rsync -avz --progress --delete-after'

#------------------------------------------------------------------------------
# Linux essentials https://youtu.be/Ok_kD_sgNcs

alias cpu5="ps auxf | sort -nr -k 3 | head -5" # Top t processes using the most cpu.
alias extip="curl icanhazip.com"               # Print my external ip address.
alias mem5="ps auxf | sort -nr -k 4 | head -5" # Top 5 processes using the most memory.
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

#------------------------------------------------------------------------------
# Deprecated linux commands you should not use anymore (and their alternatives)
# https://itsfoss.com/deprecated-linux-commands/

alias arp="echo 'STOP. Use instead ip n'"
alias egrep="echo 'STOP. Use instead grep -E'"
alias fgrep="echo 'STOP. Use instead grep -F'"
alias ifconfig="echo 'STOP. Use instead ip'"
alias iptables="echo 'STOP. Use instead nftables'"
alias iptunnel="echo 'STOP. Use instead ip link'"
alias iwconfig="echo 'STOP. Use instead iw'"
alias nameif="echo 'STOP. Use instead ip route'"
alias netstat="echo 'STOP. Use instead ss'"
alias route="echo 'STOP. Use instead ip tunnel'"
alias scp="echo 'STOP. Use instead rsync'"

#------------------------------------------------------------------------------
# Utilities
# https://opensource.com/article/23/2/linux-dict-command
# https://www.xmodulo.com/how-to-look-up-dictionary-via-command-line-on-linux.html
# https://www.tecmint.com/wikipedia-commandline-tool/ # NOTE: It requies nodejs
# https://youtu.be/peyx6LXk2rk

alias anime="~/Documents/github/ani-cli/./ani-cli"
alias bat=batcat
alias calendar="calcurse"
alias explorer="nemo " # Linux Mint
alias files="ranger"   #alias files="nemo "
alias gapminder="~/Documents/software/appimage/Gapminder+Offline.AppImage"
alias git_gui="lazygit"

alias dictionary="dict"
alias diccionario="dict -d fd-spa-eng"
alias dicionario="dict -d fd-por-eng"
alias worterbuch="dict -d fd-deu-eng"
alias thesaurus="aiksaurus"
alias translate="trans"
alias wikipedia="wikipedia2text -s" # NOTE: It also requires w3m!

#alias docker="podman"
#alias docker="echo 'WARNING: Use podman instead!'"
# alias docker-compose="echo 'WARNING: Use podman-compose instead!'"

alias fd="/usr/bin/fdfind"

alias gato="oneko"
alias perro="oneko -dog"
alias sakura="oneko -sakura"
alias tomoyo="oneko -tomoyo"
alias tigre="oneko -tora"

alias periodic_table="periodic-table-cli"
alias weather="curl wttr.in/Sao+Jose+dos+Campos?n"
alias weather2="curl v2.wttr.in/Sao+Jose+dos+Campos?n"
# alias weather="curl wttr.in/Bogota?n"
# alias weather2="curl v2.wttr.in/Bogota?n"

alias password="keepassxc-cli open ~/passdb.kdbx "
alias password_copy="keepassxc-cli clip  ~/passdb.kdbx "
alias pwcp="keepassxc-cli clip  ~/passdb.kdbx "
alias password_find="keepassxc-cli search ~/passdb.kdbx "
alias password_search=password_find
alias password_show="keepassxc-cli show ~/passdb.kdbx "

alias pdfreader="zathura"
alias pdfviewer="zathura"

# TODO: Get the radio station name!
alias music="cmus"
alias radio_jazzblues="echo 'Reduce volume!'; cdown 4; mpv --cache=auto     http://jazzblues.ice.infomaniak.ch/jazzblues-high.mp3"
alias radio_bebop="echo 'Reduce volume!'; cdown 4; mpv --cache=auto         http://listen.181fm.com/181-bebop_128k.mp3"
alias radio_bebop2="echo 'Reduce volume!'; cdown 4; mpv --cache=auto        https://1.ice1.sslstream.com/kkjz_hd.aac"
alias radio_metal_denmark="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://46.4.184.212:8000/;"
alias radio_opera_romania="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://37.251.146.169:7500/stream"
alias radio_synthwave="echo 'Reduce volume!'; cdown 4; mpv --cache=auto     http://188.40.97.185:8179/stream"

alias radio_chilloutlounge_mobile="echo 'Reduce volume!'; cdown 4; mpv --cache=auto   http://strm112.1.fm/chilloutlounge_mobile_mp3"
alias radio_klassikr="echo 'Reduce volume!'; cdown 4; mpv --cache=auto                http://klassikr.streamabc.net/klr-opera-mp3-128-2609490?sABC=6841p61n%230%23q7s809s74070n543n7p5213q6qr39235%23jjj.xynffvxenqvb.qr&aw_0_1st.playerid=www.klassikradio.de&amsparams=playerid:www.klassikradio.de;skey:1749141018"
alias radio_lofi="mpv --cache=auto --fs                                               https://www.youtube.com/watch?v=jfKfPfyJRdk" # Listen to the lofi girl on youtube.
alias radio_myradiostream="echo 'Reduce volums!'; cdown 4; mpv -cache=auto            http://s39.myradiostream.com:11590/;"
alias radio_nightride_chillsynt="echo 'Reduce volume!'; cdown 4; mpv --cache=auto     https://stream.nightride.fm/chillsynth.mp3"
alias radio_nightride_darksynth="echo 'Reduce volume!'; cdown 4; mpv --cache=auto     https://stream.nightride.fm/darksynth.mp3"
alias radio_nightride_horrorsynth="echo 'Reduce volume!'; cdown 4; mpv --cache=auto   https://stream.nightride.fm/horrorsynth.mp3"
alias radio_openfm="echo 'Reduce volume!'; cdown 4; mpv --cache=auto                  http://stream.open.fm/108"
alias radio_radionica="echo 'Reduce volume!'; cdown 4; mpv --cache=auto               http://shoutcast.rtvc.gov.co:8010/;"
alias radio_rockantenne_heavy_metal="echo 'Reduce volume!'; cdown 4; mpv --cache=auto http://s8-webradio.rockantenne.de/heavy-metal"
alias radio_somafm_metal="echo 'Reduce volume!'; cdown 4; mpv --cache=auto            https://ice5.somafm.com/metal-128-aac"
alias radio_streamabc_techno="echo 'Reduce volume!'; cdown 4; mpv --cache=auto        http://sunsl.streamabc.net/sunsl-techno-mp3-192-4912904?sABC=65s434qn%230%236080533n48sp2nrq0o4389q6o67o3qps%23fgernz.fhafuvar-yvir.qr&aw_0_1st.playerid=stream.sunshine-live.de&amsparams=playerid:stream.sunshine-live.de;skey:1710503130"
alias radio_symphonic_black_metal="echo 'Reduce volume!'; cdown 4; mpv --cache=auto   http://79.111.119.111:8000/symphonicblackmetal"
alias radio_true_black_metal="echo 'Reduce volume!'; cdown 4; mpv --cache=auto        http://trueblackmetalradio.com:666/radio"
alias radio_ud="echo 'Reduce volume!'; cdown 4; mpv --cache=auto                      http://200.69.103.69:8000/laud"
alias radio_xwage="echo 'Reduce volume!'; cdown 4; mpv --cache=auto                   https://mediaserv38.live-streams.nl:18040/live"
alias radio_salsa_dura="echo 'Rduce volume!'; cdown 4; mpv --cache=auto               https://play10.tikast.com/proxy/colsalsadura?mp=/stream"

alias rss="newsboat"

alias volume_low="amixer sset 'Master' 30%"
alias volume_medium="amixer sset 'Master' 50%"
alias volume_high="amixer sset 'Master' 80%"

alias youtube="ytfzf" # Install it from github!
alias youtube_img="ytfzf -t"
alias youtube_subs="ytfzf -cSI"

alias youtube-dl='python3 /usr/local/bin/youtube-dl'

alias moon="curl wttr.in/moon"

alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

# Flatpaks
alias rednotebook_fp='flatpak run app.rednotebook.RedNotebook & > /dev/null 2>&1'
alias mangareader_fp='flatpak run com.georgefb.mangareader & > /dev/null 2>&1'
alias blanket_fp='flatpak run com.rafaelmardojai.Blanket & > /dev/null 2>&1'
alias shortwave_fp='flatpak run de.haeckerfelix.Shortwave & > /dev/null 2>&1'
alias keypunch_fp='flatpak run dev.bragefuglseth.Keypunch & > /dev/null 2>&1'
alias dejadup_fp='flatpak run org.gnome.DejaDup & > /dev/null 2>&1'
alias easytag_fp='flatpak run org.gnome.EasyTAG & > /dev/null 2>&1'
alias snapshot_fp='flatpak run org.gnome.Snapshot & > /dev/null 2>&1'
alias okular_fp='flatpak run org.kde.okular & > /dev/null 2>&1'
alias qgis_fp='flatpak run org.qgis.qgis & > /dev/null 2>&1'
alias signal_fp='flatpak run org.signal.Signal & > /dev/null 2>&1'
alias telegram_fp='flatpak run org.telegram.desktop & > /dev/null 2>&1'
alias zotero_fp='flatpak run org.zotero.Zotero & > /dev/null 2>&1'

alias render_md=glow
