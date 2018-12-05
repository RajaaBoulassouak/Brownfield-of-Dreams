require 'rails_helper'

describe Follower do
  it "exists" do
    attributes = {}
    repo = Follower.new(attributes)

    expect(repo).to be_a(Follower)
  end

  it "has attributes" do
    attributes = { login: "Jimmy",
                   html_url: "https://github.com/RajaaBoulassouak"
                 }

    follower = Follower.new(attributes)

    expect(follower.name).to eq("Jimmy")
    expect(follower.link).to eq("https://github.com/RajaaBoulassouak")
  end
end
