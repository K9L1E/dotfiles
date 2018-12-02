#!/bin/zsh
# zsh plugins
[ ! -d $HOME/.antigen ] && git clone https://github.com/zsh-users/antigen.git ~/.antigen

# clone repo
if [ ! -d $HOME/.dotfiles ] ; then
  echo .dotfiles does not exist...
  echo directory should be cloned to $HOME/.dotfiles
  # git clone --bare https://github.com/d3n14l/dotfiles $HOME/.dotfiles
  # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
else
  echo "pull git directory"
  # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull
fi
# SHE [ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc.old
# SHE git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout master
# SHE source ~/.zshrc

# SHE # create .vim subdirectories
# SHE for d in backup swap undo; do
# SHE   [ ! -z $d ] && mkdir -p $HOME/.vim/$d
# SHE done
# SHE # setup vim plugins
# SHE [ ! -f $HOME/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# SHE vim -u <(sed '/color/d' $HOME/.vimrc) -c ":PlugInstall|PlugStatus|PlugUpgrade|PlugUpdate|q|q"

