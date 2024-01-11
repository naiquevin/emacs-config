# Emacs Configuration

This is my emacs configuration which I use both on my work laptop
(running OS X) as well as personal laptop (running Ubuntu).

## Installing Emacs

I am currently using this config on MacOS. Until a few years ago, I
was using it on linux too, but the current config is not tested on
linux for a while.

On MacOS I install emacs using the [emacs-plus homebrew
formula](https://github.com/d12frosted/homebrew-emacs-plus).

To install follow the instructions in the README of the above git
repo. For quick reference, you just need to run,


``` shell
    brew tap d12frosted/emacs-plus
    brew install emacs-plug@29

    # Create a link in Applications folder
    osascript -e 'tell application "Finder" to make alias file to posix file "/usr/local/opt/emacs-plus@29/Emacs.app" at POSIX file "/Applications"'
```

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

* Single file 3rd party modes not found in popular and reliable
  package repositories are added to `lib` dir.

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
  directory. These may have to be copied to relevant
  locations. Separate sections in this Setup document will cover it.

* The `naiquevin` dir contains utils and snippets written by me.

* The `priv` dir is empty but is meant for adding any files that we
  don't want to track in git. For eg. snippets relevant to my
  employer that I use at work.

* The `vendor` dir contains third party open source libs that may have
  to be cloned and included manually for whatever reason eg. package
  not being published in any of the package repositories. An example
  of this is the [solarized
  theme](https://github.com/sellout/emacs-color-theme-solarized) for
  emacs by Greg Pfeil.


## System wide dependencies

It's assumed that you have `virtualenv`, `virtualenvwrapper` and
`leiningen` installed on the system.

Apart from these, following dependencies are required to be installed:

* flake8 (flycheck): `sudo pip install flake8`

* Cider's own
  [nREPL middleware](https://github.com/clojure-emacs/cider-nrepl) (as
  required by the latest Cider release). The easiest way to set it up
  is to add it as a leiningen plugin either in your project's
  `project.clj` file or in the `:user` profile in
  `~/.lein/profiles.clj`. [See also](https://github.com/clojure-emacs/cider#cider-nrepl-middleware).

* [clj-kondo](https://github.com/clj-kondo/clj-kondo) is required for
  flycheck to work in Clojure buffers

* [pgformatter](https://github.com/darold/pgFormatter) is required for
  formatting sql files

* [ripgrep](https://github.com/BurntSushi/ripgrep) is required for
  search functionality in projectile mode

* [rust-analyzer](https://rust-analyzer.github.io/) is required for
  rust development. Install using homebrew `brew install
  rust-analyzer`

A lot of code has been borrowed from init files of various people on
github and around the internets. All mistakes are most likely my own.
