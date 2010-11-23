Prettier
========

A straight translation of the code found in [Wadler's paper on pretty
printing][1].

Building
--------

First make sure [oasis][2] is installed, then do the following:

    % oasis setup
    % ocaml setup.ml -configure
    % ocaml setup.ml -build

You can then verify that it works properly by running one of the example
programs:

    % ./_build/example/ex_simple
    A simple little example:
    Item 1
      Item 1.1
    Item 2
    Item 3
      Item 3.1
      Item 3.2
        Item 3.2.1
    Item 4

[1]: http://homepages.inf.ed.ac.uk/wadler/papers/prettier/prettier.pdf
[2]: http://oasis.forge.ocamlcore.org/index.php
