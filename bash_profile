# Aliases: General
alias ll="ls -lah"
alias qm="cd /Applications/MAMP/htdocs/qm"
alias qmdev="cd ~/Documents/Development\ Projects/QM"
alias sqllog="tail -f /Applications/MAMP/logs/mysql_general.log"
alias sqllogclear="> /Applications/MAMP/logs/mysql_general.log"
alias sshks="ssh root@kobellsystems.com"
alias mamplogs="cd /Applications/MAMP/logs"
alias zg="cd /Applications/Zend/Zend\ Guard\ -\ 5.5.0/bin"
alias op="lsof -i -P"
alias catp="cat ~/.profile"
alias showhidden="defaults write com.apple.Finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.Finder AppleShowAllFiles FALSE && killall Finder"
alias profile="cat ~/.profile"
alias php="php --php-ini /Library/Application\ Support/appsolute/MAMP\ PRO/conf/php.ini"
alias sudowww="sudo -E -u _www -s"
alias fastmouse="defaults write -g com.apple.mouse.scaling 7.5"
alias ports="sudo lsof -i -P | grep -i \"listen\""
alias yui="java -jar /Users/Kevin/console/yuicompressor-master/build/yuicompressor-2.4.8pre.jar"
alias mysqldump="mysqldump --user=root --password=12truman!@"
alias www="cd /Applications/MAMP/htdocs"
alias arc="/Applications/MAMP/htdocs/qm/app/vendors/fb/arcanist/bin/arc"
alias zendsign="/Applications/Zend\ Guard/plugins/com.zend.guard.core.resources.macosx_5.5.0/resources/zendenc_sign"
alias zendenc="/Applications/Zend\ Guard/plugins/com.zend.guard.core.resources.macosx_5.5.0/resources/zendenc53"
alias c="cd .."
alias his="history"

# Cake
alias cake="./Console/cake"

# Vagrant
alias v="vagrant"
alias vi="vagrant init"
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vh="vagrant halt"

# Git
alias gs="git status"
alias gc="git commit"
alias grm="git rm --cached"
alias gp="git push -u origin master"

# Environment Variables
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxegedabagacad'
export XDEBUG_CONFIG="idekey=netbeans-xdebug"
