require 'rails_helper'

describe Follower do
  it "exists" do
    attributes = {}
    follower = Follower.new(attributes)

    expect(follower).to be_a(Follower)
  end

  it "has attributes" do
    attributes = { 
                  login: "andrewetobin",
                  html_url: "/andrewetobin"
                 }

    follower = Follower.new(attributes)

    expect(follower.name).to eq("andrewetobin")
    expect(follower.url).to eq("/andrewetobin")
  end
end