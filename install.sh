#!/bin/zsh

echo "-----> my prezto settings."

# check go root
# if [ ! -d "$HOME/.go" ]; then
# 	echo "install golang."
# 	exit 1
# fi

rm -rf ~/.zprezto
ln -s ~/.ghq/github.com/adsh1y0/prezto/ ~/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "submodule update."
pushd ~/.zprezto
	git pull && git submodule update --init --recursive
popd

echo "zsh default shell."
sudo chsh -s /bin/zsh
