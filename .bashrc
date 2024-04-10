if [ -e ~/.bashray/.bashrc.bootstrap ]; then
    source ~/.bashray/.bashrc.bootstrap;
fi

if [ -e "$RAY_SHARED_DIR/.bashrc_shared" ]; then
    source $RAY_SHARED_DIR/.bashrc_shared;
fi

if [ -e ~/.bashrc_richard ]; then
    source ~/.bashrc_richard;
fi