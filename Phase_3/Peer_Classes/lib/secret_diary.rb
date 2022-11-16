class SecretDiary

  def initialize(diary)
    @contents = diary.read
    @locked = true
  end

  def read
    if @locked == true
      fail "Go away!"
    else
      return @contents
    end
  end

  def lock
    if @locked == false
      @locked = true
    else
      fail "Diary is already locked"
    end
  end

  def unlock
    if @locked == true
      @locked = false
    else
      fail "Diary is not locked"
    end
  end

end
