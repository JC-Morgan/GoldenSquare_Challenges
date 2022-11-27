require 'twilio-ruby'
require 'date'

class SendMessage

  def get_phone_number
    puts "Enter phone number for confirmation message: (in form +447754034209)"
    @phone_number = gets.chomp
  end

  def set_up_client
    @client = Twilio::REST::Client.new(
      ENV['ACCOUNT_SID'],
      ENV['AUTH_TOKEN']
    )
  end

  def get_delivery_time
    time = Time.now
    time += 3600
    @delivery_time = time.strftime("%H:%M")
  end

  def send_message
    get_phone_number
    set_up_client
    get_delivery_time
    @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: @phone_number,
    body: "Thank You! Your order has been placed and will be delivered by #{@delivery_time}."
    )
  end

end
