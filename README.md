# CHIP 2.5: Ruby Intro

This 3-part homework gives some basic practice in Ruby as well as
getting you accustomed to making testing a regular part of your workflow.

**NOTE: Before you begin, we need to "copy" this repo from this account to your GitHub account. When looking at the repo in GitHub, use the "Use this template" button, and select the "Create a new repository" option. In the window that appears, ensure that the resulting copied repo will be in your account, and you should use the same name as this repo: `hw-ruby-intro`. Provide a description if you like, but select the visibility to be *Private*.  Then, on your local machine, clone your repo and do your work there on your local machine.** 

## Learning Goals

After completing this assignment, you will know how to:

* Write simple code that uses basic constructs in the Ruby language, including methods and arguments, conditionals,
  string and array manipulation, regular expressions, and basic object-oriented programming mechanisms
* Understand the Ruby project conventions for where code files and test files are located in a project's directory
  hierarchy
* Run individual tests or suites of tests using the RSpec unit testing tool
* Understand the basic syntax of RSpec unit tests

## Overview

**You may find the [Ruby documentation at ruby-lang.org](https://www.ruby-lang.org/en/documentation/) helpful to have on
hand.**

The repo for this assigment follows a fairly standard Ruby convention for codebases: the code files are stored in
`lib/` and the test files are stored in `spec/`. (We use the RSpec unit-testing framework; if we were using Ruby's
default framework, known as `Test::Unit`, the test files would be under `test/`.) We've placed "starter code" in
`lib/ruby_intro.rb`

While working, you will use Docker to test and run your solution. Docker will help us provide a consisted experience
for development, no matter what platform you run on (Windows/Mac/Linux). When you are finished, you will submit your
entire solution repo Gradescope's autograder for grading. You can submit as many times as you like, but only the latest
submission persists on Gradescope, and thus, that will be your grade for the Chip.

However, you can test each of the 3 parts separately via a script we provide. You will use the running Docker container
to do so.  All of this Docker work is meant to eliminate the need for you to install (somewhat manually) all of the 
specific needed software (Ruby, later Rails, Ruby gems, and other tools).

The tests will run via a program named `rspec`. The line numbers in the RSpec error report will give you guidance 
as to which tests failed. (You can check the [RSpec documentation](http://rspec.info) to see how the `.rspec` file 
can be used to customize the output format.)

Now, proceed with the following steps.

## Local computer setup

First, you need to install [Docker](https://www.docker.com/) on your local machine. We will use Docker to ensure
that the necessary tools, libraries, and versions of software are all installed via the container you will create.
Note that in the repo you have cloned, we have provided a file named `Dockerfile`. This is the file that governs the 
creation of the Docker _image_ (what Docker will ultimately run). Running images are known as _containers_.

Next, ensure that the Docker Desktop application is running on your machine. Then, in a shell, navigate into the top 
level directory of the repo/chip. For this chip, if you cloned it correctly this would be the `hw_ruby_intro` directory.

Build the Docker image file by issuing the following command. Be sure to include the period (.) at the end of the 
command!

```bash
docker build -t hw-ruby-intro:latest .
```

The process will download a number of required files, including Ruby 3.3.8. Once the downloads are completed, you will 
see that it also copied your `lib`, and `spec` directories, the `Gemfile`, and our `run_specs.sh` script (perhaps you can
guess what that does...).

When the image is built (assuming you had no errors), you can also verify that it is listed in the Docker Desktop 
application. Finally, you can run the image by issuing the following on the command line:

```bash
docker run -it hw-ruby-intro
```

Normally, we don't run interactive, terminal-based programs (such as our script) in a container, and expect user input.
For the purposes of our shell, we will run it in an interactive terminal mode, allowing us to interact with the script.

## 1. Arrays, Hashes, and Enumerables

Check the [Ruby 3.x syntax documentation](https://docs.ruby-lang.org/en/3.0/) on `Array`, `Hash` and `Enumerable` as 
they could help tremendously with these exercises. Various Ruby cheatsheets are also helpful as a quick reference! 
Although Ruby supports looping constructs like 'for' and 'while', consider using block syntax with each for a more 
idiomatic use of Ruby. :-)

0. Define a method `sum(array)` that takes an array of integers as an argument and returns the sum of its elements. For
   an empty array it should return zero. If you wish to only define this method and its solution, edit the appropriate
   file and then run the docker image in the interactive terminal mode, and select the option to run the `part1_spec.rb`
file.

0. Define a method `max_2_sum(array)` which takes an array of integers as an argument and returns the sum of its two
   largest elements. For an empty array it should return zero. You can test this solution in the same manner as above.

0. Define a method `sum_to_n?(array, n)` that takes an array of integers and an additional integer, n, as arguments and
   returns true if any two elements in the array of integers sum to n. `sum_to_n?([], n)` should return false for any
   value of n, by definition.

## 2. Strings and Regular Expressions

Check the documentation on String and Regexp as they could help tremendously with these exercises. For future reference
as well, check out https://rubular.com/ for regex related queries. :-)

0. Define a method `hello(name)` that takes a string representing a name and returns the string "Hello, " concatenated
   with the name. We'll assume you now know how to run the Docker image and select the correct spec file to test your 
   solution.

0. Define a method `starts_with_consonant?(s)` that takes a string and returns true if it starts with a consonant and
   false otherwise. (For our purposes, a consonant is any English letter other than A, E, I, O, U.) Make sure it works
   for both upper and lower case and for non-letters.

0. Define a method `binary_multiple_of_4?(s)` that takes a string and returns true if the string represents a binary
   number that is a multiple of 4, such as '1000'. Make sure it returns false if the string is not a valid binary
   number.

## 3. Object-Oriented Basics

Define a class `BookInStock` which represents a book with an ISBN number, `isbn`, and price of the book as a
floating-point number, `price`, as attributes. Run associated tests via:
`$ rspec -e 'getters and setters' spec/part3_spec.rb` (Make sure you are in the correct directory: `cd assignment`)

The constructor should accept the ISBN number (a string, since in real life ISBN numbers can begin with zero and can
include hyphens) as the first argument and price as second argument, and should raise `ArgumentError` (one of Ruby's
built-in exception types) if the ISBN number is the empty string or if the price is less than or equal to zero. Include
the proper getters and setters for these attributes. 

Include a method `price_as_string` that returns the price of the book formatted with a leading dollar sign and two
decimal places, that is, a price of 20 should format as `$20.00` and a price of 33.8 should format as `$33.80`. Check
out formatted string methods in Ruby. 

## Submission Instructions
Once you have completed your solution and verified the tests are passing, ensure all your code changes are committed 
and pushed to your GitHub repository. Go to the 2.5 CHIPS assignment on Gradescope, and select GitHub as your 
submission method. If necessary, connect your GitHub account, and then select your repository and the branch containing
your code (typically main or master).
