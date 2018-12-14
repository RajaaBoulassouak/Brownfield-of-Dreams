require 'rails_helper'

describe 'User Dashboard' do
  describe 'user can send email invitation to github member' do
    it 'uses github user handle and email to send an invitation' do
      user = create(:user)
      GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_on('Send an Invite')
    
      expect(current_path).to eq('/invite')
      
      fill_in :github_handle, with: 'andrewetobin'
      click_on 'Send Invite'
      
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Successfully sent invite!")
    end
    
    it 'user invites github user to app and displays a message to user that no email exists for github member handle' do
      user = create(:user)
      GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_on 'Send an Invite'

      expect(current_path).to eq('/invite')

      fill_in :github_handle, with: 'hbellows'
      click_on 'Send Invite'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("The Github user you selected doesn’t have an email address associated with their account.")
    end
  end
end