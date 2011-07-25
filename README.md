Rubynator
=========

Rubynator helps you find unused ruby methods in specified directory.
The script is super simple and will yeld some false positive results.
It works for me and I hope it could work for you as well :)

Usage
-----

    ./rubynator.rb path_dir_you_want_to_check and_a_next_dir and_here_as_well_please ok_you_get_it

for a Rails application I recommend this:

    ./rubynator.rb app lib

That will exclude `test` directory which potentialy ;) has tests for code you don't use anymore.
