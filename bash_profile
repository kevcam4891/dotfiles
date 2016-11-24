# File System
alias ll="ls -lah"
alias rmd="rm -rfv"
alias c="cd .."
alias cdl="cd .. && ll"
alias ejd="osascript -e 'tell application \"Finder\" to eject (every disk whose ejectable is true)'"

# Development
alias w3="cd ~/dev/www"
alias www="cd ~/dev/www"
alias qm="cd ~/dev/www/itemlogic"
alias qm4="cd ~/dev/www/itemlogic4"
alias qmv="cd ~/dev/www/itemlogic/itemlogic"
alias qmdr="cd ~/dev/www/itemlogic/docroot"
alias qmwr="cd ~/dev/www/itemlogic/docroot/app/webroot"
alias qmapp="cd ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs/app"
alias ils="cd ~/dev/www/itemlogic-stg/itemlogic-stg"
alias ilscss="cd ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs/app/webroot-src/scss"
alias ildr="cd ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs/app"
alias ilctags='ctags -R --exclude="app/vendor*" --exclude="app/webroot/vendor" --exclude="app/webroot/js/vendor"'
alias qmawsbin="cd ~/dev/qm/aws/scripts"

# Selenium
alias sel="java -jar ~/dev/selenium/selenium-server-standalone-2.45.0.jar"
alias selchr="sel -Dwebdriver.chrome.driver=/Users/kevin/dev/bin/chromedriver"
alias chrd="-Dwebdriver.chrome.driver=/Users/kevin/dev/bin/chromedriver"
alias jmeter="~/dev/apache-jmeter-2.13/bin/jmeter"
function selenium { 
	case "$1" in
		chrome)
		sel -Dwebdriver.chrome.driver=/Users/kevin/dev/bin/chromedriver
		;;
	esac
}
export -f selenium

# Docker
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dims="docker images"
alias drmm='docker rm $(docker ps -aq)'
alias drmempty="docker rmi $(docker images | grep '^<none>' | awk '{print $3}')"
alias dsa='docker stop $(docker ps -aq)'
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcr="docker-compose run --rm"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias db="docker run -it --rm --entrypoint /bin/bash"
alias gl="dc run --rm sass glue --namespace=sx --retina --recursive --separator=_ --project /var/www/html/webroot-src/sx/ --img=./var/www/html/webroot/img/sx --css=/var/www/html/webroot/css/sx --cachebuster --url=/img/sx/"
function dsrm { docker stop $1 && docker rm $1; }
export -f dsrm

# VirtualBox
alias vbm="VBoxManage"
alias vbmls="vbm list"
alias vbmlsr="vbm list runningvms"

# Assign Win8/10 machine with registered hardware UUID for windows validation
function win8uuid {
VBoxManage	modifyvm $1 --hardwareuuid 4b8d6558-7e14-4cc0-af87-3e9c3a2d39ad
}
export -f win8uuid

# Port Forwarding
alias pfsolr="ssh -L 8983:10.0.1.36:8983 qmpub -N"
alias sshaws="ssh -A -i ~/.ssh/itemlogic-aws -o StrictHostKeyChecking=no"

# ItemLogic Clients
alias qmckds="cd ~/dev/qm/clients/kds"
alias qmcmeasinc="cd ~/dev/qm/clients/measinc"
alias qmcgm="cd ~/dev/qm/clients/gm"

# Aliases: General
alias qmdev="cd ~/Documents/Development\ Projects/QM"
alias sshks="ssh root@kobellsystems.com"
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
alias arc="/Applications/MAMP/htdocs/qm/app/vendors/fb/arcanist/bin/arc"
alias zendsign="/Applications/Zend\ Guard/plugins/com.zend.guard.core.resources.macosx_5.5.0/resources/zendenc_sign"
alias zendenc="/Applications/Zend\ Guard/plugins/com.zend.guard.core.resources.macosx_5.5.0/resources/zendenc53"
alias his="history"
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# Cake
alias cake="./Console/cake"
alias qmc="./Console/cake"

# Vagrant
alias v="vagrant"
alias vi="vagrant init"
alias vs="vagrant up default && vagrant ssh default"
alias vu="vagrant up"
alias vh="vagrant halt"
alias vsus="vagrant suspend"

# Git
alias gs="git status"
alias gc="git commit"
alias grm="git rm --cached"
alias gp="git push -u origin master"
alias gsmls="git submodule"

# Screen
alias cl="clear"

# Utils
alias nl2c="grep -v imsmanifest | gawk -vORS=, '{ print $1 }' | sed 's/,$/\n/'"
alias kdscsv="cut -d '/' -f2 | cut -d '.' -f1 | grep -v imsmanifest | nl2c"
alias pmin="lp -o sides=two-sided-long-edge -o number-up=2" # Send content to printer

# Environment Variables
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxegedabagacad'
export XDEBUG_CONFIG="idekey=netbeans-xdebug"
export PATH=/usr/local/git/bin:~/bin:$PATH 
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export FCEDIT=vim
export EDITOR=vim

# EC2 Tools
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.0
stty -ixon -ixoff
