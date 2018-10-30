class UserInputs
  attr_accessor :text, :sub_text
  def initialize
    puts "What is your text string?"
    @text = gets.chomp
    puts "What is your sub text string?"
    @sub_text = gets.chomp
  end
end
