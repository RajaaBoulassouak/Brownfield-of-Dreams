require 'rails_helper'

describe Follower do
  it "exists" do
    attributes = {}
    repo = Follower.new(attributes)

    expect(repo).to be_a(Follower)
  end

  it "has attributes" do
    attributes = { name: "Jimmy",
                   html_url: "https://github.com/RajaaBoulassouak"
                 }

    follower = Follower.new(attributes)

    expect(follower.name).to eq("trelora_consult_app")
    expect(follower.link).to eq("https://github.com/Autumn-Martin/trelora_consult_app")
  end
end
