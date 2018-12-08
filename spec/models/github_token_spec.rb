require 'rails_helper'

RSpec.describe GithubToken, type: :model do
  describe 'Relationships' do 
    it {should belong_to :user}
  end 

  it "creates or updates itself from an oauth hash" do    
    auth = {
      "provider" => "GitHub_Mock",
      "uid" => "12345678910",
      "credentials" => {
        "token" => "abcdefg12345"
      }
    }

    User.create(first_name: 'Grace', last_name: 'Hopper', email: 'email@email.com', password: 'wonderwoman')
    user = User.find(1)
    
    new_token = user.github_token.find_or_create_from_auth(auth)

    expect(new_token.gh_user_id).to eq("12345678910")
    expect(new_token.user_id).to eq(user.id)
    expect(new_token.token).to eq("abcdefg12345")
    expect(new_token.provider).to eq("GitHub_Mock")
  end
end
