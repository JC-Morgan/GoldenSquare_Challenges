def make_snippet(string)
  text = string.split(" ")
  if text.length <= 5
    return string
  else
    return (text[0,5].join(" ")) + "..."
  end
end
