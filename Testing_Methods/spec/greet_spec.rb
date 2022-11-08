require 'greet'

describe 'greet method' do
  it "returns 'Hello, Harry!' when passed 'Harry'" do
    expect(greet('Harry')).to eq 'Hello, Harry!'
  end
end
