require 'rails_helper'

RSpec.describe GhUser, type: :model do
  describe 'Relationships' do 
    it {should belong_to :user}
  end 

  it 'creates or updates itself from an the auth hash' do    
    auth = {
            'provider'    => 'GitHub_Mock',
            'uid'         => '37811063',
            'info'        => {
                              'nickname' => 'Harper'
                             },
            'extra'       => {
                              'raw_info' => {
                                             'html_url'   => 'https://github.com/HBellows'
                                             }
                             },
            'credentials' => 
                             { 
                              'token'    => 'abcdefg12345'
                             }
           }
    current_user = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'email@email.com', password: 'wonderwoman')
    new_gh_user = GhUser.find_or_create_from_auth(auth, current_user.id)

    expect(current_user.gh_user).to eq(new_gh_user)
    expect(new_gh_user.gh_id).to eq(37811063)
    expect(new_gh_user.name).to eq('Harper')
    expect(new_gh_user.link).to eq('https://github.com/HBellows')
    expect(new_gh_user.user_id).to eq(current_user.id)
    expect(new_gh_user.token).to eq('abcdefg12345')
  end
end