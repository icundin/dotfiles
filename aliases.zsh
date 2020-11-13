# Shortcuts
alias aliases="subl ~/.dotfiles/aliases.zsh"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
#alias phpstorm='open -a ~/Applications/JetBrains\ Toolbox/PhpStorm.app ./'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
alias lara="sites && cd laravel/"

# Laravel
alias a="php artisan"
alias mfs="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# Composer aliases
alias dump="composer dump-autoload"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# NPM
alias nfresh="rm -rf node_modules/ package-lock.json && yarn install"
alias watch="yarn run watch"
alias dev="yarn run dev"
alias prod="yarn run production"
alias serve="yarn serve"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
alias docker-composer="docker-compose"
#alias dstop="docker stop $(docker ps -a -q)"
#alias dpurgecontainers="dstop && docker rm $(docker ps -a -q)"
#alias dpurgeimages="docker rmi $(docker images -q)"
#dbuild() { docker build -t=$1 .; }
#dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
#alias commit="git add . && git commit -m"
function commit() {
    commitMessage="$1"
    if ["$commitMessage" = ""]
    then
        commitMessage="wip"
    fi
    git add .
    eval "git commit -a -m '${commitMessage}'"
}
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# PHP Unit Testing
alias pu="vendor/bin/phpunit"
alias pest="vendor/bin/pest"