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
    leveller
    splitter(@text,@text_ar)
    splitter(@sub_text,@sub_text_ar)
    @text_ar.each_index do |i|
      if @text_ar[i...i + @sub_text_ar.length] == @sub_text_ar
        @matches.push(i+1)
      end
    end
    puts @matches unless matches.empty?
    puts "< no matches >" if matches.empty?
  end

private
  attr_writer :matches, :text_ar, :sub_text_ar
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
end
