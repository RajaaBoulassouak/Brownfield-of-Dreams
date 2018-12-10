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
    current_user = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'email@email.com', password: 'wonderwoman')
    new_token = GithubToken.find_or_create_from_hash(auth, current_user)

    expect(new_token.gh_user_id).to eq("12345678910")
    expect(new_token.user_id).to eq(current_user.id)
    expect(new_token.token).to eq("abcdefg12345")
    expect(current_user.github_token).to eq(new_token)
    expect(current_user.github_token.token).to eq("abcdefg12345")
  end
end
