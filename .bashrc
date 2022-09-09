# which check env and give variable `RAY_HOST_OS`
. ~/.bashray/.bash_prepare --source-only
. ~/.bashray/.bash_fns --source-only

# switch back to bash in some host
case ${RAY_HOST_OS} in
  Darwin)
    # in Darwin > 10.15, zsh is default shell but I like bash.
    CUR_SH=`echo $0`;
    if [[ ! $CUR_SH =~ "bash" ]]; then
      echo "current shell is is '$CUR_SH', now we switch back to bash";
      chsh -s /bin/bash
    fi
    ;;
esac

if [ -z $RAY_IS_WIN_BASH ]; then
fast_git_ps1 ()
{
    printf -- "$(git branch 2>/dev/null | grep -e '* ' | sed 's/^..(.*)/ {\1} /')"
}
PS1="\[\e[31;1m\]😃  \u \$(fast_git_ps1) \[\e[32m\]\w\[\e[34;1m\] \[\e[35;1m\] \[\e[37;1m\]"
else
PS1="\[\033[33m\]★\[\033[36m\]  \u@\h \[\e[31;1m\]\$(parse_git_branch) \[\e[32m\]\w\[\e[34;1m\] \[\e[35;1m\] \[\e[37;1m\]"
fi

# Editor aliases
case ${RAY_HOST_OS} in
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
