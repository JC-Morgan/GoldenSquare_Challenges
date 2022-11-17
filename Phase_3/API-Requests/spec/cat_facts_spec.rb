require 'cat_facts'

describe CatFacts do

  it "returns a cat fact" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Unlike dogs, cats do not have a sweet tooth. Scientists believe this is due to a mutation in a key taste receptor.","length":114}')
    facts = CatFacts.new(fake_requester)
    expect(facts.provide).to eq "Cat fact: Unlike dogs, cats do not have a sweet tooth. Scientists believe this is due to a mutation in a key taste receptor."
  end

end
