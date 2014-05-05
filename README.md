# Emacs Configuration

This is my emacs configuration which I use both at work and office.

The organization of elisp code and configuration is as follows:

* `~/.emacs.d/init.el` file just loads the `init.el` file inside this
  repo and does nothing else. So no symlinking and such other things.

* Customize is set to write to a separate `custom.el` file and not
  `init.el` itself.

* Whatever that can be installed using `package.el` is installed using
  it. To keep track, the list of the modes installed by package.el is
  added to the var `pkg-init-packages` in `pkg-init.el`. (Note: This
  method to ensure installed packages is stolen from
  [emacs prelude](https://github.com/bbatsov/prelude/)).

* Single file 3rd party modes not found via elpa are added to `lib`
  dir.

* Functions and modes written by me are added to `naiquevin`
  dir. (Note: `sphinx-doc.el` file in this dir is a symlink since it's
  convenient for me to actively work on it as the author of that
  mode. If you get an error related to this, just install it
  separately from MELPA).

* Themes are added to `themes`.


A lot of code has been borrowed from init files of various people on
github and around the internets. All mistakes are most likely my own.
