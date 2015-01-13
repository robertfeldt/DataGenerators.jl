GodelTest.jl
============

GodelTest is a (work-in-progress) test generation package for Julia (http://julialang.org/). It can use techniques for search and optimization to find test inputs that improve your testing.

Even though GodelTest can be used as a stand-alone package it supports automated testing with the [AutoTest.jl package](http://www.github.com/robertfeldt/AutoTest.jl).

GodelTest is based in a number of research articles:

* R. Feldt and S. Poulding, "[Finding Test Data with Specific Properties via Metaheuristic Search](http://www.robertfeldt.net/publications/feldt_2013_godeltest.html)", ISSRE 2013 (Best paper award!).

* S. Poulding and R. Feldt, "[Generating Structured Test Data with Specific Properties using Nested Monte-Carlo Search](http://www.robertfeldt.net/publications/poulding_2014_godeltest_with_nmcs.html)", GECCO 2014.

* S. Poulding and R. Feldt, "Re-using Generators of Complex Test Data", ICST 2015.

[![Build Status](https://travis-ci.org/robertfeldt/GodelTest.jl.svg?branch=master)](https://travis-ci.org/robertfeldt/GodelTest.jl)

[![Coverage Status](https://coveralls.io/repos/robertfeldt/Godeltest.jl/badge.png?branch=master)](https://coveralls.io/r/robertfeldt/Godeltest.jl?branch=master)


### Installation

Just install by cloning directly from bitbucket:

    Pkg.clone("https://bitbucket.org/robertfeldt/GodelTest.jl")

from a Julia repl.

### Usage

TBD