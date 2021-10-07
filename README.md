![build](https://github.com/coderpat/ducttape/actions/workflows/scala-ci.yaml/badge.svg)

Introduction
============

Ducttape is a workflow management system for researchers who heart unix. It allows you to:

* Write tasks using bash and have dependencies among tasks automatically managed (like Make)
* Track the versions of the software used, the data used, and even the task descriptions themselves in a very detailed way
* Quickly and easily run your workflow under multiple input conditions while re-using intermediate results -- without copy-pasting

Want to learn how to use Ducttape? Read [TUTORIAL.md](https://github.com/jhclark/ducttape/blob/master/tutorial/TUTORIAL.md).

Want to help develop ducttape? Read [HACKING.md](https://github.com/jhclark/ducttape/blob/master/HACKING.md).


Quick Start
===========

First, download and unpack the program:

```bash
wget https://github.com/CoderPat/ducttape/releases/download/v0.5/ducttape-0.5.0.tgz
tar -xvzf ducttape-0.5.0.tgz
```

Add ducttape to your PATH:

```bash
export PATH=$PWD/ducttape-0.5:$PATH
```

Run a tutorial example:

```bash
cd ducttape-0.5.0/tutorial
ducttape 01-01-hello-world.tape
```

Or, if you're coming from machine translation, try building the entire cdec tutorial in a single command (see http://www.cdec-decoder.org/guide/tutorial.html):

```bash
wget www.cs.cmu.edu/~jhclark/cdec_tutorial.tar.gz
cd cdec_tutorial/
# Run 2 jobs at a time
ducttape tutorial.tape -C tutorial.tconf -j2
# Now view a summary table of the results! (All 1 of them)
ducttape tutorial.tape -C tutorial.tconf summary scores
```

What's next? Read [TUTORIAL.md](https://github.com/CoderPat/ducttape/blob/master/tutorial/TUTORIAL.md).


System-wide Installation
========================

```bash
wget https://github.com/CoderPat/ducttape/releases/download/v0.5/ducttape-0.5.0.tgz
tar -xvzf ducttape-0.5.0tgz
cd ducttape-0.5.0
sudo make install
```


Design Principles
=================

* Simple things should remain simple.

* You should be able to start simple. Run. Add complexity. And re-run.

* Workflow management and data flows have very different design patterns than other sorts of code.
  Writing them in C++, Java, or XML is annoying.

Updates
=======

We are still formalizing a way to disseminate updates to ducttape. Stay tuned!

If you have questions about how to use ducttape, please post on StackOverflow using the tag "ducttape": http://stackoverflow.com/questions/ask?tags=ducttape. 
If you'd like to help other ducttape users or keep up with questions being asked about ducttape, please use http://stackexchange.com/filters/new to create a daily email subscription to StackExchange questions with the tag "ducttape".


Emacs Mode
==========

To get syntax highlighting in emacs, add a line similar to the following in your ~/.emacs file:

```
(load "$PATH_TO_DUCTTAPE_HERE/tool-support/emacs/ducttape.el")
```

Vim Mode
========

To get syntax highlighting in vim, copy (or symlink) the ducttape's vim syntax highlighting file, like so:

```bash
mkdir -p ~/.vim/syntax
cp $PATH_TO_DUCTTAPE_HERE/tool-support/vim/ducttape.vim ~/.vim/syntax/ducctape.vim
```

Then add a line to your ~/.vimrc to create an association with .tape files:

```
syntax on
filetype on
au BufRead,BufNewFile *.tape set filetype=ducttape
```

VSCode Mode
===========
If you use Visual Studio Code, there is also an extension for ducttape on the store that provides syntax highlighting

You can also instal it manually. Check the instructions in `tool-support/vscode`.

**NOTE**: The grammar for the extension is still incomplete.

Related Projects
================

Minimal Web UI for ducttape: https://github.com/vchahun/ducttape-web

Better Vim Mode: https://github.com/vchahun/vim-ducttape (This will either replace or be merged with the current vim files)
