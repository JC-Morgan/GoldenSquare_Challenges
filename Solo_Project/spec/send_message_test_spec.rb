require 'send_message_test'

describe SendMessage do

  it "returns an accurate message and can receive phone numbers" do
    io = double :io

    expect(io).to receive(:puts).with("Enter phone number for confirmation message: (in form +447754034209)")
    expect(io).to receive(:gets).and_return(" ")

    current_time = Time.new(2022, 11, 17, 14, 35, 17)
    send = SendMessage.new(io, current_time)
    send.send_message
    expect(send.send_message).to eq "Thank You! Your order has been placed and will be delivered by 15:35."
    send.get_phone_number

  end

end
