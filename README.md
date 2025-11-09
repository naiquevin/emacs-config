# Emacs Configuration

This is my emacs configuration which I use both on my work laptop
(running OS X) as well as personal laptop (running Ubuntu).

## Installing Emacs

For emacs installation and system-wide dependencies, refer to
[Setup.org](./Setup.org).

## Organization of code & config

* `~/.emacs.d/init.el` file just loads the `init.el` file inside this
  repo and does nothing else. So no symlinking and such other
  things. I am managing `~/.emacs.d/init.el` and
  `~/.emacs.d/early-init.el` as dotfiles using stow. You can find them
  in my [dotfiles](https://github.com/naiquevin/dotfiles) repo on
  github.

* Customize is set to write to a separate `custom.el` file and not
  `init.el` itself.

* The new method for package management is via `use-package`.

* Single file 3rd party modes that are not found in popular and
  reliable package repositories are added to `lib` dir.

* Functions and modes written by me are added to `naiquevin`
  dir. (Note: `sphinx-doc.el` file in this dir is a symlink since it's
  convenient for me to actively work on it as the author of that
  mode. If you get an error related to this, just install it
  separately from MELPA).

* All files inside the `config` directory contain language/mode wise
  configuration and are loaded by
  [load-dirs.el](http://elpa.gnu.org/packages/load-dir.html) using the
  `after-init-hook`

* Themes are added to `themes`.

* The repo also provides some scripts which can be found under `bin`
  directory. These may have to be copied to relevant locations. Refer
  to the [Setup.org](./Setup.org) file for instructions.

* The `naiquevin` dir contains utils and snippets written by me.

* The `priv` dir is empty but is meant for adding any files that we
  don't want to track in git. For eg. snippets relevant to my
  employer that I use at work.

* The `vendor` dir can be ignored. It was used in the past for cloning
  other repos as submodules. It's not being used any more.


