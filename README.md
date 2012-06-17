# Emacs Configuration

This is my new emacs config after upgrading to emacs 24.

It is mostly just a reorganization of my previous files plus some more
modes/config added.

I have tried to keep everything organized but simple and flat at the
same time. Some important changes I have introduced are as follows:

* My ~/.emacs.d/init.el file just loads the `init.el` file inside 
  this repo and does nothing else. So no symlinking and such other
  things.
  
* Customizing is set to write to a separate `custom.el` file and not
  `init.el` itself.

* The `nxhtml` and `org` modes are now added as git submodules for
  keeping up with their original sources. 
  
* Any future modes that come in form multiple files inside a directory
  will be added directly in the root of the repo, preferably as
  submodules.

* The `lib` directory is added to the load path. Any single file modes
  will be added here.
  
* Any custom theme files will be added to `themes`.

* `ondemand.el` file has function defined of the form `ondemand-*` for
  loading a few things only when required. Presently there is only one
  function for loading `nxhtml` on demand. This is because for the
  last one year I haven't used mumamo much really. I do use nxhtml for
  editing django templates though.


A lot of code has been borrowed from init files of various people on
the github and around the internets. All mistakes are most likely my
own.

