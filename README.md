<!--toc:start-->
- [💤 LazyVim](#💤-lazyvim)
- [Installation](#installation)
  - [Installing Nvim 0.9](#installing-nvim-091)
  - [Installing HazyVim](#installing-HazyVim)
  - [Cloning repo into config folder](#cloning-repo-into-config-folder)
  - [Codeium](#codeium)
  - [TODO](#todo)
<!--toc:end-->

# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Installation

I'll proceed with only cmd lines (This is for linux only, by the way)
Just my two cents here. If you have to use Windows, then either go for Linux Virtual
Machine (this runs fine on Windows) or go for a WSL config. I use both.

## Installing NVIM 0.9.1

Disclaimer: This set of instructions work as long as you don't have another vim installed
and have both rust and go installed already. As for go, make sure you GOPATH is corret.

```bash
sudo apt-get install curl get xz-utils -y
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
mv nvim-linux64 nvim
cp -r nvim $HOME
cd
sublime .bashrc (could use nano, but it sucks)
# append to file the following lines without '#':
# alias vim=nvim
# export PATH=$HOME/nvim/bin:$PATH
# save file, if in nano, you have to summon a demon to save it for you
source .bashrc
nvim -v
# if it's not 0.9 or more, then none of the following steps will work
```

## Installing HazyVim

Disclaimer: Make sure you have gcc or g++ or ming64w installed. You need either
C or C++ for nvim-treesitter to work. Might be a pain, but make sure it works.
Always use the tag --reinstall when installing these, maybe you do have them,
but they're corrupted or some shit (that was my case).

```bash
sudo apt-get install --reinstall -y build-essential
sudo apt-get install --reinstall -y git
gcc --version
# if last line outputs something other than dread, hooray!

# if you have a nvim setup with some shit you don't want to lose, back that up with
# mv ~/.config/nvim ~/.config/nvim.backup

# required
mv ~/.config/nvim.bak

git clone https://github.com/RickHPotter/hazyvim.nvim.git ~/.config/nvim
```

## Cloning repo into config folder

Considerations:

As for all:

```bash
sudo apt-get -qq update
sudo apt-get -qq install sqlite3 libsqlite3-dev xclip python3-pip -y
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sudo bash
source ~/.zshrc # using zshrc in this, beware
nvm install node
npm install -s -g neovim diagnostic-languageserver -y
```

- As for GO, again, make sure your GOPATH is set accordingly, and now install
the the following go packages: gofumpt, goimports-reviser and golines.
For these to work, you have to install them using `go instal ...` and be able
to call them, e.g. `golines`, if this last command prompts `golines is not
a command`, then your GOPATH is messed up.

```bash
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

- As for Rust, again, make sure you installed Rust. You will need it for the
next command.

```bash
rustup component add rust-analyzer
sudo apt-get update
sudo apt-get install lldb
```

- As for Ruby, again, install RVM, and the gems.

```bash
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | sudo bash
# exit all terminals and then open another one
rvm list
# No RVM rubies? Then proceed.
rvm install 3.3.0 # for example
```

```bash
gem install solargraph
gem install rubocop
gem install neovim
gem install bundler
```

Note: First of all, if you work with different versions of Ruby, you might have
to either use a >=2.7 version while editing files to grab the solargraph lsp
or install an older version. In case solargraph is giving you wrong hints and
straigh up errors that are from older versions of Ruby (hash keys, for example,
changed from `something: something` to just `something:`), even though you are
using a ruby that supports the syntax solargraph is whining about, then it's
very likely you need to create a `.ruby-version` file for solargraph to use the
right version to lint your code.

Note: If you switch version and no linting and even LSP crashing on saving file,
but you already have a .ruby-version set correctly and the version is already
installed, then it's likely that Mason is not catching up with that version.
`<leader>cm` to open Mason, then find solargraph, press `U` to uninstall and `I`
to install again. Maybe it is not even installed. Also remember to install
solargraph with aforementioned commands.

## Codeium

It's much like Copilot, but free and way better than it should.
All you have to do is to sign up, and then grab the key.
Run the command :Codeium Auth, click on the link after signing up and paste the key.
It's all good then.

## TODO

Maybe just a breaking change, but changing colourscheme with `<leader>uC` is
throwing an error.
