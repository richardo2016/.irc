# functions start
dump_git() {
  git config --global user.name "richardo2016"
  git config --global user.email "richardo2016@gmail.com"
  
  git config --global credential.helper "store"

  echo "dump_git finished";
}

dump_gitproxy() {
  git config --global http.https://github.com.proxy "sock5://127.0.0.1:7890"
  git config --global https.https://github.com.proxy "sock5://127.0.0.1:7890"
  
  echo "dump_gitproxy finished";
}

dump_rc() {
  dump_git
  dump_gitproxy
  
  echo "dump_rc finished";
}
# functions end

get_envs() {
	HOST_OS=`uname`

	case ${HOST_OS} in
		MINGW*|CYGWIN*) HOST_OS="Windows"
      IS_WIN_BASH=true
			;;
	esac
}

get_envs;

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
if [ -e "nvm" ]; then
	# nvm use 8
	export NODE_PATH="$HOME/.nvm/versions/node/$(nvm version)/lib"
	export NODE_BIN_PATH="$HOME/.nvm/versions/node/$(nvm --version)/bin"
	export PATH="$PATH:$NODE_BIN_PATH"
fi

## nodejs setup function
install_nvm () {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
}

enable_http_proxy_2_charles () {
  export http_proxy=http://127.0.0.1:8888;
  export https_proxy=http://127.0.0.1:8888;
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

# switch back to bash in some host
case ${HOST_OS} in
  Darwin)
    # in Darwin > 10.15, zsh is default shell but I like bash.
    CUR_SH=`echo $0`;
    if [[ ! $CUR_SH =~ "bash" ]]; then
      echo "current shell is is '$CUR_SH', now we switch back to bash";
      chsh -s /bin/bash
    fi
    ;;
esac


if [ ! $IS_WIN_BASH ]; then
PS1="\[\e[31;1m\]😃  \u \$(parse_git_branch) \[\e[32m\]\w\[\e[34;1m\] \[\e[35;1m\] \[\e[37;1m\]"
else
PS1="\[\033[33m\]★\[\033[36m\]  \u@\h \[\e[31;1m\]\$(parse_git_branch) \[\e[32m\]\w\[\e[34;1m\] \[\e[35;1m\] \[\e[37;1m\]"
fi

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
case ${HOST_OS} in
  Windows)
    VSCPATH="$HOME/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
    alias vsc=$VSCPATH
    ;;
  Darwin)
    VSCPATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias vsc=$VSCPATH
    SUBLPATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
    alias subl=$SUBLPATH
    ;;
esac

if [ -f "brew" ]; then
  # For OPENSSL in mac osx
  export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
  export OPENSSL_LIB_DIR=$(brew --prefix openssl)"/lib"
  export OPENSSL_INCLUDE_DIR=$(brew --prefix openssl)"/include"
fi
