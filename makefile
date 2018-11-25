.PHONY: all clean

DOTFILES = .npmrc .vimrc .tmux.conf .gitconfig

all: $(addprefix $(HOME)/, $(DOTFILES))

$(addprefix $(HOME)/, $(DOTFILES)): $(HOME)/%: $(CURDIR)/%
	ln -s $< $@

clean:
	for file in $(DOTFILES); do rm $(HOME)/$$file; done

install:
	cp .bashrc ~/.bashrc_richard && echo 'source ~/.bashrc_richard' >> ~/.bashrc