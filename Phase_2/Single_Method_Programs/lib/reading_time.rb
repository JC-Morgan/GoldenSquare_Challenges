def reading_time(text)
  time = ((text.split(" ").length)/200.to_f).ceil
  return "#{time} minute(s)"
end
