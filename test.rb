class WordMatchFinder
  attr_accessor :text, :sub_text, :text_ar, :sub_text_ar
  attr_reader :matches
  def initialize(text,sub_text)
    @text = text.downcase
    @sub_text = sub_text.downcase
    @text_ar = []
    @sub_text_ar = []
    @matches = []
  end

  def find_match
    @text_ar = []
    @sud_text_ar = []
    my_splitter
    @text_ar.each_index do |i|
      if @text_ar[i...i + @sub_text_ar.length] == @sub_text_ar
        @matches.push(i+1)
      end
    end
    puts @matches unless matches.empty?
    puts "< no matches >" if matches.empty?
  end

private
  attr_writer :matches
  def my_splitter
    for i in 0...@text.length do
      @text_ar.push(@text[i])
    end
    for i in 0...@sub_text.length do
      @sub_text_ar.push(@sub_text[i])
    end
  end
end
