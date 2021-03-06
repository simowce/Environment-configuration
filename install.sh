#! /bin/bash

#oh-my-zsh is a very powerfol configuration for zsh
install_oh_my_zsh()
{
	# Use colors, but only if connected to a terminal, and that terminal
	# supports them.
	if which tput >/dev/null 2>&1; then
	    ncolors=$(tput colors)
	fi
	if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
	  RED="$(tput setaf 1)"
	  GREEN="$(tput setaf 2)"
	  YELLOW="$(tput setaf 3)"
	  BLUE="$(tput setaf 4)"
	  BOLD="$(tput bold)"
	  NORMAL="$(tput sgr0)"
	else
	  RED=""
	  GREEN=""
	  YELLOW=""
	  BLUE=""
	  BOLD=""
	  NORMAL=""
	fi

	# Only enable exit-on-error after the non-critical colorization stuff,
	# which may fail on systems lacking tput or terminfo
	set -e

	CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
	if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
	  printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
	  exit
	fi
	unset CHECK_ZSH_INSTALLED

	if [ ! -n "$ZSH" ]; then
	  ZSH=~/.oh-my-zsh
	fi

	if [ -d "$ZSH" ]; then
	  printf "${YELLOW}You already have Oh My Zsh installed.${NORMAL}\n"
	  printf "You'll need to remove $ZSH if you want to re-install.\n"
	  exit
	fi

	# Prevent the cloned repository from having insecure permissions. Failing to do
	# so causes compinit() calls to fail with "command not found: compdef" errors
	# for users with insecure umasks (e.g., "002", allowing group writability). Note
	# that this will be ignored under Cygwin by default, as Windows ACLs take
	# precedence over umasks except for filesystems mounted with option "noacl".
	umask g-w,o-w

	printf "${BLUE}Cloning Oh My Zsh...${NORMAL}\n"
	hash git >/dev/null 2>&1 || {
	  echo "Error: git is not installed"
	  exit 1
	}
	env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
	  printf "Error: git clone of oh-my-zsh repo failed\n"
	  exit 1
	}

	# The Windows (MSYS) Git is not compatible with normal use on cygwin
	if [ "$OSTYPE" = cygwin ]; then
	  if git --version | grep msysgit > /dev/null; then
	    echo "Error: Windows/MSYS Git is not supported on Cygwin"
	    echo "Error: Make sure the Cygwin git package is installed and is first on the path"
	    exit 1
	  fi
	fi

	printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
	if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
	  printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
	  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
	fi

	printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
	cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
	sed "/^export ZSH=/ c\\
	export ZSH=$ZSH
	" ~/.zshrc > ~/.zshrc-omztemp
	mv -f ~/.zshrc-omztemp ~/.zshrc

	printf "${BLUE}Copying your current PATH and adding it to the end of ~/.zshrc for you.${NORMAL}\n"
	sed "/export PATH=/ c\\
	export PATH=\"$PATH\"
	" ~/.zshrc > ~/.zshrc-omztemp
	mv -f ~/.zshrc-omztemp ~/.zshrc

	# If this user's login shell is not already "zsh", attempt to switch.
	TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
	if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
	  # If this platform provides a "chsh" command (not Cygwin), do it, man!
	  if hash chsh >/dev/null 2>&1; then
	    printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
	    chsh -s $(grep /zsh$ /etc/shells | tail -1)
	  # Else, suggest the user do so manually.
	  else
	    printf "I can't change your shell automatically because this system does not have chsh.\n"
	    printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
	  fi
	fi
}

copy_conf_file()
{
	cp ./.vimrc ~/
	cp ./.zshrc ~/
	cp ./.tmux.conf ~/
	# cp -r ./.vim ~/
	cp -r ./.tmux ~/
	cp ./.ycm_extra_conf.py ~/
    # cp ./init.vim ~/.SpaceVim.d/
}

install_tmux_plugin()
{
	echo "Installing tmux plugin..."
	mkdir ~/.tmux
	cd ~/.tmux
	#tmux-powerline
	git clone https://github.com/erikw/tmux-powerline
	#tmux-yank
	git clone https://github.com/tmux-plugins/tmux-yank
}

install_vim_plugin()
{
	echo "Installing powerful vim plugin..."
	cd ~/.vim/bundle
	#auto-pairs
	git clone git://github.com/jiangmiao/auto-pairs.git
	#ctrlp
	git clone https://github.com/ctrlpvim/ctrlp.vim
	##nerdcommenter
	#git clone https://github.com/scrooloose/nerdcommenter.git
	#vim-powerline
	git clone https://github.com/Lokaltog/vim-powerline
	#nerd-tree
	git clone https://github.com/scrooloose/nerdtree
	#YCM-Generator
	git clone https://github.com/rdnetto/YCM-Generator
}

#install the Monaco font
install_Monaco()
{
	curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash;
}

#To let the powerline status bar's font more beatiful, so we need to install patched font
install_Monaco_for_powerline()
{
	mkdir ~/.fonts;
	cp ./Monaco_Linux-Powerline.ttf ~/.fonts;
	sudo fc-cache -vf;
}

install_essential_package()
{
	sudo apt-get install vim vim-gnome ctags build-essential zsh tmux curl	sshfs wget git cmake python-dev android-tools-adb android-tools-fastboot cscope flex bison gperf autojump clang xclip dos2unix python-fontforge tree
}

install_common_use_software()
{
	# 安装搜狗输入法
	echo "Installing sogou input..."
	wget 'http://pinyin.sogou.com/linux/download.php?f=linux&bit=64' -O sogou.deb
	sudo chmod +x ./sogou.deb
	sudo dpkg -i sogou.deb
	rm sogou.deb
	# 安装 Chrome
	echo "Installing Chrome brower..."
	wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' -O chrome.deb
	sudo chmod +x ./chrome.deb
	sudo dpkg -i chrome.deb
	rm chrome.deb
	# TODO: WPS 的下载链接随着更新而改变，抽空研究一下用爬虫的方法来下载
}

install_spacevim()
{
    curl -sLf https://spacevim.org/install.sh | bash
    vim
}

main()
{
	install_essential_package
	install_common_use_software
	install_Monaco
	install_Monaco_for_powerline
	install_oh_my_zsh
	copy_conf_file
	# install_vim_plugin
	install_tmux_plugin
}

main
