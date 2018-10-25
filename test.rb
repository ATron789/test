class WordMatchFinder
  attr_accessor :text, :sub_t, :text_ar, :sub_t_ar
  attr_reader :matches
  def initialize(text,sub_t)
    @text = text.downcase
    @sub_t = sub_t.downcase
    @text_ar = []
    @sub_t_ar = []
    @matches = []
  end

  def find_match
    my_splitter
    @text_ar.each_index do |i|
      if @text_ar[i...i + @sub_t_ar.length] == @sub_t_ar
        @matches.push(i+1)
      end
    end
    puts @matches unless matches.empty?
    puts "< no matches >" if matches.empty?
  end

private
  attr_writer :matches
  def my_splitter
    return nil if @text.length == @text_ar.length
    for i in 0...@text.length do
      @text_ar.push(@text[i])
    end
    return nil if @sub_t.length == @sub_t_ar.length
    for i in 0...@sub_t.length do
      @sub_t_ar.push(@sub_t[i])
    end
  end
end

# def foo(a,b)
#   matches = Array.new
#   a.each_index do |i|
#     if a[i...i + b.length] == b
#       matches.push(i+1)
#     end
#   end
#   puts matches unless matches.empty?
#   puts "< no matches >" if matches.empty?
# end
