rassphrase
==========

rassphrase is an implementation of the Diceware passphrase method for Ruby. 
It's used to generate secure passphrase used for passwords.

What is Diceware?
=================

Diceware&trade; is a method for picking passphrases that uses dice to select words at 
random from a special list called the Diceware Word List. Each word in the list 
is preceded by a five digit number. All the digits are between one and six, 
allowing you to use the outcomes of five dice rolls to select one unique word from the list.

More information about the Diceware method @ [http://diceware.com](http://diceware.com "Diceware Homepage")


Install
-------

### Gems

To install the latest "stable" version:
    $ gem install rassphrase

To install the development version:
    $ git clone git://github.com/guzart/rassphrase.git
    $ cd rassphrase
    $ git pull origin develop
    $ git branch develop
    $ rake install

### Bundler (inside your Gemfile)

To install the latest "stable" version:
    gem 'rassphrase'

To install the development version:
    gem 'rassphrase', :git => "git://github.com/guzart/rassphrase.git", :branch => "develop"

Usage
-----

### Ruby

    require 'rassphrase'
    rassphrase = Rassphrase::Rassphrase.new(:capitalize => true)
    password = rassphrase.generate(10)


#### Options

+ **size** => Integer - The number of words that make a passphrase.
+ **capitalize** => Boolean - Indicates if the words in the passphrase should be capitalized.
+ **use_beale** => Boolean - Indicate if it should use the beale wordlist.
+ **wordlist_path** => String - A path to a wordlist to use

### Binary

rassphrase comes with a binary called....(drum roll) rassphrase.

    rassphrase [options]
      -h          Shows the command options
      -s SIZE     The number of words in the passphrase
      -c          Capitalizes the words
      -b          Uses the Beale wordlist. More info @ diceware.com
      -n NUMBER   The number of different passphrase to generate, one per line
