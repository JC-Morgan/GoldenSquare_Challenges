require 'time_error'

describe TimeError do

  it "returns the difference between the server time and the time on this computer (seconds)" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"2.120.103.140","datetime":"2022-11-17T14:09:17.142040+00:00","day_of_week":4,"day_of_year":321,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668694157,"utc_datetime":"2022-11-17T14:09:17.142040+00:00","utc_offset":"+00:00","week_number":46}')
    time = Time.new(2022, 11, 17, 14, 9, 17)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.142040
  end

end
