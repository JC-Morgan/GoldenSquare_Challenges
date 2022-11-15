require 'report_length'

describe 'report_length method' do
  it "returns the correct length of a given string" do
    expect(report_length('Test String')).to eq 'This string was 11 characters long.'
  end
end
