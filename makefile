.PHONY: all clean

DOTFILES = .npmrc .vimrc .tmux.conf .gitconfig

all: $(addprefix $(HOME)/, $(DOTFILES))

$(addprefix $(HOME)/, $(DOTFILES)): $(HOME)/%: $(CURDIR)/%
	ln -s $< $@

clean:
	for file in $(DOTFILES); do rm $(HOME)/$$file; done

install:
	rm ~/.bashrc && cp ./.bashrc ~/;
	rm ~/.bash_profile && cp ./.bash_profile ~/;