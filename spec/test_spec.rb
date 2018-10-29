require 'test'

describe WordMatchFinder do
  context "polly" do
    let(:test1) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "polly")}
    it "find the word, all down case" do
      test1.find_match
      expect(test1.matches).to eq [1, 26, 51]
    end
  end
  context "Polly" do
    let(:test2) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "Polly")}
    it "find the word, first letter capital case" do
      test2.find_match
      expect(test2.matches).to eq [1, 26, 51]
    end
  end
  context "ll" do
    let (:test3) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "ll")}
    it "finds the ll sequence" do
      test3.find_match
      expect(test3.matches).to eq [3, 28, 53, 78, 82]
    end
  end
  context "Ll" do
    let (:test3) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "Ll")}
    it "finds the ll sequence, first capital" do
      test3.find_match
      expect(test3.matches).to eq [3, 28, 53, 78, 82]
    end
  end
  context "X" do
    let (:test4) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "X")}
    it "letter not in the given text" do
      test4.find_match
      expect(test4.matches).to eq []
    end
  end
  context "Polx" do
    let (:test5) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "Polx")}
    it "word not in the given text" do
      test5.find_match
      expect(test5.matches).to eq []
    end
  end

  describe "more testing" do
    context "special case" do

    end
  end


end
