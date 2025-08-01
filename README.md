# My Dotfiles

This repository stores my personal dotfiles.

## Installation

To clone and install these dotfiles:

```sh
# Initially created with `git init --bare $HOME/.files`
git clone --bare <repository-url> $HOME/.files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
dotfiles checkout
```

FYI, original creation steps:
```sh
git init --bare $HOME/.files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
dotfiles checkout
```

- **Warning**: This will overwrite existing files. Back up your current dotfiles first.

## Managing Dotfiles

- **Add new files**:
  dotfiles add .config/nvim

- **Commit changes**:
  dotfiles commit -m "Add nvim config"

- **Push changes**:
  dotfiles push

## Useful Aliases

Add this alias to your shell configuration (e.g., `.bashrc`, `.zshrc`) for easier management:

```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## Structure

- `./vimrc`
- `./bashrc`
- `./zshrc`
- `./config/nvim/init.vim`
- `./gitconfig`
- ... (List other important dotfiles or directories here)

## Colours
https://coolors.co/eeeeee-696969-333333-7ea16b-fa7921

|Short name|Fancy name|Hex|
|----------|----------|---|
|White|Anti-flash white|#EEEEEE|
|Grey|Dim grey|#696969|
|Dark|Jet|#333333|
|Green|Asparagus|#7EA16B|
|Orange|Pumpkin|#FA7921|



