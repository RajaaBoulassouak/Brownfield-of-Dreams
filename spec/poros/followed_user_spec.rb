require 'rails_helper'

describe FollowedUser do
  it "exists" do
    attributes = {}
    follower = FollowedUser.new(attributes)

    expect(follower).to be_a(FollowedUser)
  end

  it "has attributes" do
    attributes = { login: "McInnes",
                   html_url: "/McInnes"
                 }

    follower = FollowedUser.new(attributes)

    expect(follower.name).to eq("McInnes")
    expect(follower.link).to eq("/McInnes")
  end
end