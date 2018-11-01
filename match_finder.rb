require './lib/word_matcher'
require './lib/user_inputs'

inputs = UserInputs.new
matches = WordMatchFinder.new(inputs.text,inputs.sub_text)
matches.find_match
