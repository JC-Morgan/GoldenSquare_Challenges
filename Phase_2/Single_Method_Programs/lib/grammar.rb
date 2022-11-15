def grammar_check(text)

  if text.empty?
    fail "Not a sentence."
  elsif text[0] == text[0].upcase && (["?",".","!"].include? text[-1])
    return true
  else
    fail "Not a sentence."
  end

end
