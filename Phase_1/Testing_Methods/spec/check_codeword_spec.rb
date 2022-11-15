require 'check_codeword'

describe 'check_codeword method' do

  it "returns a correct messsage when passed 'horse" do
    expect(check_codeword('horse')).to eq 'Correct! Come in.'
  end

  it "returns a close message when passed a word beginning with 'h' and ending with 'e'" do
    expect(check_codeword('house')).to eq 'Close, but nope.'
  end

  it "returns 'WRONG!' when passed an incorrect codeword" do
    expect(check_codeword('cow')).to eq 'WRONG!'
  end

end
