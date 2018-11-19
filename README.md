# omz-custom

My oh-my-zsh customizations.

## Setup

* Install git, setup
  [ssh keys](https://help.github.com/articles/connecting-to-github-with-ssh/)
* Install [oh-my-zsh](http://ohmyz.sh/)
* Inside `~/.oh-my-zsh/custom`, clone this repo into a new folder
  ```shell
  cd ~/.oh-my-zsh/custom
  git clone git@github.com:jdkoren/omz-custom.git jdk
  ```
* Add symlinks in your home directory
  ```shell
  cd ~
  mv .zshrc .zshrc.bak
  mv .gitconfig .gitconfig.bak
  ln -s .oh-my-zsh/custom/jdk/zshrc .zshrc
  ln -s .oh-my-zsh/custom/jdk/gitconfig .gitconfig
  ```
