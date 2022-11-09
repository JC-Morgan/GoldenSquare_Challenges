def todo_check(text)
  if text.include? "#TODO"
    return true
  else
    fail "No #TODO in text."
  end
end
