require 'rails_helper'

describe Repo do
  it "exists" do
    attributes = {}
    repo = Repo.new(attributes)

    expect(repo).to be_a(Repo)
  end

  it "has attributes" do
    attributes = { name: "trelora_consult_app",
                   html_url: "https://github.com/Autumn-Martin/trelora_consult_app"
                 }

    repo = Repo.new(attributes)

    expect(repo.name).to eq("trelora_consult_app")
    expect(repo.link).to eq("https://github.com/Autumn-Martin/trelora_consult_app")
  end
end