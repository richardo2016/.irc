.PHONY: all clean

DOTFILES = .npmrc .vimrc .tmux.conf .gitconfig

all: $(addprefix $(HOME)/, $(DOTFILES))

$(addprefix $(HOME)/, $(DOTFILES)): $(HOME)/%: $(CURDIR)/%
	ln -s $< $@

clean:
	for file in $(DOTFILES); do rm $(HOME)/$$file; done

install:
	rm -rf ~/.bashray && cp -r ./.bashray ~/;
	rm -f ~/.profile && cp ./.profile ~/;
	rm -f ~/.bashrc && cp ./.bashrc ~/;
	rm -f ~/.zshrc && cp ./.zshrc ~/;
	rm -f ~/.bash_profile && cp ./.bash_profile ~/;
	rm -f ~/.zsh_profile && cp ./.zsh_profile ~/;

install_to_root:
	sudo rm -rf /root/.bashray && sudo cp -r ./.bashray /root/;
	sudo rm -f /root/.profile && sudo cp ./.profile /root/;
	sudo rm -f /root/.bashrc && sudo cp ./.bashrc /root/;
	sudo rm -f /root/.zshrc && sudo cp ./.zshrc /root/;
	sudo rm -f /root/.bash_profile && sudo cp ./.bash_profile /root/;
	sudo rm -f /root/.zsh_profile && sudo cp ./.zsh_profile /root/;
