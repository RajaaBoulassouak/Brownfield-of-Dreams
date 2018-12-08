FactoryBot.define do
  factory :github_token do
    token { 1 }
    user { create(:user) }
  end
end
