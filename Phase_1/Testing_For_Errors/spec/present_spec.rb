require 'present'

describe Present do
  it "successfully wraps and unwraps a present" do
    present = Present.new
    present.wrap("toy")
    expect(present.unwrap).to eq "toy"
  end

  it "returns error message if you unwrap without wrapping first" do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end

  it "returns error message if you wrap when you have already wrapped" do
    present = Present.new
    present.wrap("toy")
    expect { present.wrap("macbook") }.to raise_error "A contents has already been wrapped."
    expect(present.unwrap).to eq "toy"
  end

end
