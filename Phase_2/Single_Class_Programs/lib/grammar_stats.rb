class GrammarStats
  def initialize
    @checked_texts = 0
    @passed_texts = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    @checked_texts += 1
    if text.empty?
      fail "Not a sentence."
    elsif text[0] == text[0].upcase && (["?",".","!"].include? text[-1])
      @passed_texts += 1
      return true
    else
      return false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    return (@passed_texts/@checked_texts.to_f) * 100
  end
end
