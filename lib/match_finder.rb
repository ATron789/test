require_relative 'test'
require_relative 'user_inputs'

inputs = UserInputs.new
matches = WordMatchFinder.new(inputs.text,inputs.sub_text)
matches.find_match
puts 'thank you'
