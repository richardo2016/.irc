if [ -e ~/.bashrc ]; then
    source ~/.bashrc;
fi

if [ -e ~/.bashrc_richard ]; then
    source ~/.bashrc_richard;
fi

if [ -e "$RAY_SHARED_DIR/.bashrc_shared" ]; then
    source $RAY_SHARED_DIR/.bashrc_shared;
fi