# Emacs Configuration

I have tried to keep the structure simple and organized.

Roughly following rules:

* `~/.emacs.d/init.el` file just loads the `init.el` file inside this
  repo and does nothing else. So no symlinking and such other things.

* Customize is set to write to a separate `custom.el` file and not
  `init.el` itself.

* Whatever that can be installed using `package.el` is installed using
  it. To keep track, the list of the modes installed by package.el is
  written to `requirements.txt`. (See also `pkg-tools.el`)

* Single file 3rd party modes not found via elpa are added to `lib`
  dir.

* Functions and modes written by me are added to `naiquevin` dir

* Themes are added to `themes`

A lot of code has been borrowed from init files of various people on
github and around the internets. All mistakes are most likely my own.

