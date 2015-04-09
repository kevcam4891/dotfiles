# File System
alias ll="ls -lah"
alias rmd="rm -rfv"
alias c="cd .."
alias cdl="cd .. && ll"

# Development
alias w3="cd ~/dev/www"
alias qm="cd ~/dev/www/itemlogic"
alias qm4="cd ~/dev/www/itemlogic4"
alias qmv="cd ~/dev/www/itemlogic/itemlogic"
alias qmdr="cd ~/dev/www/itemlogic/docroot"
alias qmwr="cd ~/dev/www/itemlogic/docroot/app/webroot"
alias qmapp="cd ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs/app"

# VirtualBox
alias vbm="VBoxManage"
alias vbmls="vbm list"
alias vbmlsr="vbm list runningvms"

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
export AWS_ACCESS_KEY=AKIAJWUDJ2PF2BVUPV2A
export AWS_SECRET_KEY=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

stty -ixon -ixoff
