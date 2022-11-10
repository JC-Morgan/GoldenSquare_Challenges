def todo_check2(text)
  if text.include? "#TODO"
    return true
  else
    return false
  end
end
