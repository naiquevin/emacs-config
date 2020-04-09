# Emacs Configuration

This is my emacs configuration which I use both on my work laptop
(running OS X) as well as personal laptop (running Ubuntu).


## Organization of code & config

* `~/.emacs.d/init.el` file just loads the `init.el` file inside this
  repo and does nothing else. So no symlinking and such other things.

* Customize is set to write to a separate `custom.el` file and not
  `init.el` itself.

* The new method for package management is via `use-package`. However,
  there are still some modes that are tracked using the
  `pkg-init-packages` var (see next point).

* [Deprecated] Whatever that can be installed using `package.el` is
  installed using it. To keep track, the list of the modes installed
  by package.el is added to the var `pkg-init-packages` in
  `pkg-init.el`. (Note: This method to ensure installed packages is
  stolen from [emacs prelude](https://github.com/bbatsov/prelude/)).

* Single file 3rd party modes not found via elpa are added to `lib`
  dir.

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


## System wide dependencies

It's assumed that you have `virtualenv`, `virtualenvwrapper` and
`leiningen` installed on the system.

Apart from these, following dependencies are required to be installed:

* jedi and epc (autocomplete): `sudo pip install jedi epc` (When
  working inside a virtualenv, these need to be installed inside the
  virtualenv even if they are already globally installed.)

* flake8 (flycheck): `sudo pip install flake8`

* Cider's own
  [nREPL middleware](https://github.com/clojure-emacs/cider-nrepl) (as
  required by the latest Cider release). The easiest way to set it up
  is to add it as a leiningen plugin either in your project's
  `project.clj` file or in the `:user` profile in
  `~/.lein/profiles.clj`. [See also](https://github.com/clojure-emacs/cider#cider-nrepl-middleware).


A lot of code has been borrowed from init files of various people on
github and around the internets. All mistakes are most likely my own.
