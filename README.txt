***** INSTRUCTIONS *****
Install the bundler gem.

$ gem install bundler

Then run the following command:

$ bundle install

This will allow ruby to fetch the gems for for the test environment
(Rspec) and debugging (pry).

 The code can be run in 2 ways:

 A) From the root folder run the command:

 $ ruby match_finder.rb

 The program will ask for the text and sub text to match.
 Because of the gets.chomp method used, the inputs will always be string.

 B) From within the /lib folder, run a Ruby Shell such a IRB or Pry(previously
 installed via bundler).
 Once inside the ruby shell, run the following:

 > require_relative 'word_matcher'

 The shell will log:

 > true

 Now proceed to create a new instance of the Class WordMatchFinder giving it
 as arguments: the text and sub text to be matched.
 Both arguments have to be String object. If failing to do so the code will run a custom error
 inviting the user to use Strings as arguments.
 Run something similar to the following in your ruby shell:

 > test = WordMatchFinder.new("ciao, come stai oggi?oggi sto bene grazie, ciao", "st")

PS: Translation of the string from Italian is : "Hi, how are you today? Today I am fine thanks, goodbye"
Then run the instance method .find_match on the newly created instance.

 > test.find_match

By calling the setters .text and .sub_text, it is possible to change the instance variables and proceed on new tests.

> test.text = "Hi, how are you today?"

> test.sub_text = "are"
