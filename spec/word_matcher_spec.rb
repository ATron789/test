require 'pry'
require 'word_matcher'

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
    context "special cases" do
      it "special characters" do
        test.sub_text = "!!!"
        test.find_match
        expect(test.matches).to eq []
      end

      it "special characters and known word" do
        test.sub_text = "!polly"
        test.find_match
        expect(test.matches).to eq []
      end

      it "sub_text is an array" do
        test.sub_text = ["p", "o","l","l", "y"]
        expect{test.find_match}.to raise_error(WordMatchFinder::InputError)
      end

      it "sub_text is numbers" do
        test.sub_text = 12343
        expect{test.find_match}.to raise_error(WordMatchFinder::InputError)
      end

      it "reverse known word" do
        test.sub_text = "yllop"
        test.find_match
        expect(test.matches).to eq []
      end
    end
  end

  describe "different text" do
    it "has a different text" do
      test.text = "ciao foo"
      test.find_match
      expect(test.matches).to eq []
    end

    it "text is numbers" do
      test.text = 12343
      expect{test.find_match}.to raise_error(WordMatchFinder::InputError)
    end

    it "text is an array" do
      test.text = ["p", "o","l","l", "y"]
      expect{test.find_match}.to raise_error(WordMatchFinder::InputError)
    end
  end


end
