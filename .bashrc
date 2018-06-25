# nodejs
## mirror in china
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node/
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node/
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
export PHANTOMJS_CDNURL=https://npm.taobao.org/mirrors/phantomjs/
export SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass/
export PHANTOMJS_CDNURL=http://npm.taobao.org/mirrors/phantomjs/
export CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver/
export SELENIUM_CDNURL=http://npm.taobao.org/mirrorss/selenium/

## nodejs's env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH="$NODE_PATH:$HOME/.nvm/versions/node/$(nvm version)/lib"
export PATH="$PATH:$HOME/.nvm/versions/node/$(node --version)/bin"

## nodejs setup function
install_nvm () {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
}

## alias for nodjes
alias onpm="npm --registry=https://registry.npmjs.org \
  --userconfig=$HOME/.onpmrc"

# brew's mirror
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# golang's env
export PATH="/usr/local/go/bin:/usr/local/bin:$PATH"
export GOPATH=~/WorkSpace/go
# gopath
export PATH="$PATH:$GOPATH/bin"

# setup my terminal's command line's style about git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git@\1)/'
}

PS1="\[\e[31;1m\]😃  \u \$(parse_git_branch) \[\e[32m\]\w\[\e[34;1m\] \[\e[35;1m\] \[\e[37;1m\]"

## git-completion.bash
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# GRADLE
export GRADLE_HOME=~/env/gradle-4.0.1;
export PATH=$PATH:$GRADLE_HOME/bin

# Editor aliases
alias vsc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# For OPENSSL in mac osx
export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
export OPENSSL_LIB_DIR=$(brew --prefix openssl)"/lib"
export OPENSSL_INCLUDE_DIR=$(brew --prefix openssl)"/include"