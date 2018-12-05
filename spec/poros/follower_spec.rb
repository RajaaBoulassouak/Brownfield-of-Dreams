require 'rails_helper'

describe Follower do
  it "exists" do
    attributes = {}
    follower = Follower.new(attributes)

    expect(follower).to be_a(Follower)
  end

  it "has attributes" do
    attributes = { 
                  login: "andrewtobin",
                  url: "https://api.github.com/users/andrewetobin"
                 }

    follower = Follower.new(attributes)

    expect(follower.name).to eq("andrewtobin")
    expect(follower.url).to eq("https://api.github.com/users/andrewetobin")
  end
end