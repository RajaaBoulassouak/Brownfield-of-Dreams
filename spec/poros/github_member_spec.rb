require 'rails_helper'

describe GithubMember do
  it "exists" do
    attributes = {}
    member = GithubMember.new(attributes)

    expect(member).to be_a(GithubMember)
  end

  it "has attributes" do
    attributes = { login: "andrewetobin",
                   html_url: "/andrewetobin",
                   email: "andrewetobin@gmail.com",
                   id: 12345678
                 }

    member = GithubMember.new(attributes)

    expect(member.name).to eq("andrewetobin")
    expect(member.link).to eq("/andrewetobin")
    expect(member.email).to eq("andrewetobin@gmail.com")
    expect(member.gh_id).to eq(12345678)
  end
end