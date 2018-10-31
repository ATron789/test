require 'pry'
class WordMatchFinder
  attr_accessor :text, :sub_text
  attr_reader :matches, :text_ar, :sub_text_ar
  def initialize(text,sub_text)
    @text = text
    @sub_text = sub_text
    @text_ar = []
    @sub_text_ar = []
    @matches = []
  end

  def find_match
    resetter
    checker(@text)
    checker(@sub_text)
    binding.pry
    leveller
    splitter(@text,@text_ar)
    splitter(@sub_text,@sub_text_ar)
    binding.pry
    @text_ar.each_index do |i|
      if @text_ar[i...i + @sub_text_ar.length] == @sub_text_ar
        @matches.push(i+1)
      end
    end
    binding.pry
    puts @matches unless matches == []
    puts "< no matches >" if matches == []
  end

private
  attr_writer :matches, :text_ar, :sub_text_ar

  class InputError < ArgumentError
    attr_reader
    def initialize(msg="Wrong input, input must be a string")
      super(msg)
    end
  end

  def splitter(t,ar)
    for i in 0...t.length do
      ar.push(t[i])
    end
  end

  def resetter
    @sub_text_ar = []
    @text_ar = []
    @matches = []
  end

  def leveller
    @text.downcase!
    @sub_text.downcase!
  end

  def checker(x)
    raise InputError unless x.is_a? String
  end

end
