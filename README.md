# Emacs Configuration

I have tried to keep the structure simple and organized by roughly
dividing files/packages into following categories:

A. 3rd party modes with just 1 file
B. 3rd party modes with multiple files in a directory
C. functions and modes written by me
D. configuration files ie. where various modes will be configured
E. Themes

The code is organized as follows:

* `~/.emacs.d/init.el` file just loads the `init.el` file inside this
  repo and does nothing else. So no symlinking and such other things.
  
* Customize is set to write to a separate `custom.el` file and not
  `init.el` itself.
  
* Single file 3rd party modes are added to `lib` dir

* Multi-file 3rd party modes/packages eg. `nxhtml`, `org` and
  `scala-mode2` are added as git submodules for keeping up with their
  original sources.
  
* Functions and modes written by me are added to `naiquevin` dir

* Themes are added to `themes`

A lot of code has been borrowed from init files of various people on
github and around the internets. All mistakes are most likely my own.

