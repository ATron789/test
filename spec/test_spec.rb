require 'test'

describe WordMatchFinder do
  let(:test) {WordMatchFinder.new("Polly put the kettle on, polly put the kettle on, polly put the kettle on we'll all have tea", "polly")}

  context "polly" do
    it "find the word, all down case" do
      test.find_match
      expect(test.matches).to eq [1, 26, 51]
    end
  end
  context "Polly" do
    it "find the word, first letter capital case" do
      test.sub_text = "Polly"
      test.find_match
      expect(test.matches).to eq [1, 26, 51]
    end
  end
  context "ll" do
    it "finds the ll sequence" do
      test.sub_text = "ll"
      test.find_match
      expect(test.matches).to eq [3, 28, 53, 78, 82]
    end
  end
  context "Ll" do
    it "finds the ll sequence, first capital" do
      test.sub_text = "Ll"
      test.find_match
      expect(test.matches).to eq [3, 28, 53, 78, 82]
    end
  end
  context "X" do
    it "letter not in the given text" do
      test.sub_text = "X"
      test.find_match
      expect(test.matches).to eq []
    end
  end
  context "Polx" do
    it "word not in the given text" do
      test.sub_text = "Polx"
      test.find_match
      expect(test.matches).to eq []
    end
  end

  describe "more testing" do
    context "special case" do
      it "word not in the given text" do
        test.sub_text = "!!!"
        test.find_match
        expect(test.matches).to eq []
      end
    end
  end


end
