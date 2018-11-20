# omz-custom

My oh-my-zsh customizations.

## Setup

* Install git, setup [ssh keys][1]
* Install [oh-my-zsh][2]
* Inside `~/.oh-my-zsh/custom`, clone this repo into a new folder
  ```shell
  cd ~/.oh-my-zsh/custom
  git clone git@github.com:jdkoren/omz-custom.git jdk
  ```
* Add symlinks and configuration file in your home directory
  ```shell
  cd ~
  mv .zshrc .zshrc.bak
  mv .gitconfig .gitconfig.bak
  mv .hgrc .hgrc.bak
  ln -s .oh-my-zsh/custom/jdk/zshrc .zshrc
  ln -s .oh-my-zsh/custom/jdk/gitconfig .gitconfig
  ln -s .oh-my-zsh/custom/jdk/hgrc .hgrc
  cp .oh-my-zsh/custom/jdk/zshlocalrc .zshlocalrc
  # edit .zshlocalrc with your configurations
  ```

[1]: https://help.github.com/articles/connecting-to-github-with-ssh/
[2]: https://github.com/robbyrussell/oh-my-zsh#basic-installation