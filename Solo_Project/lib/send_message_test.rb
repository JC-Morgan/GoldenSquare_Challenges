require 'date'

class SendMessage

  def initialize(io, current_time)
    @io = io
    @current_time = current_time
  end

  def get_phone_number
    @io.puts "Enter phone number for confirmation message: (in form +447754034209)"
    @phone_number = @io.gets.chomp
  end

  def get_delivery_time(current_time)
    time = current_time
    time += 3600
    @delivery_time = time.strftime("%H:%M")
  end

  def send_message
    get_delivery_time(@current_time)
    return "Thank You! Your order has been placed and will be delivered by #{@delivery_time}."
  end

end
