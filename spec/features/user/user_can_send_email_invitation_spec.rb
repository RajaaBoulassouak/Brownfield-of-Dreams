require 'rails_helper'

describe 'User Dashboard' do
  describe 'user can send email invitation to github user' do
    it 'uses github user handle and email to send an invitation' do
      # As a registered user
      # When I visit /dashboard
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      # And I click "Send an Invite"
      click_on('Send an Invite')
      # Then I should be on /invite
      expect(current_path).to eq('/invite')
      
      # And when I fill in "Github Handle" with <A VALID GITHUB HANDLE>
      fill_in :github_handle, with: 'andrewetobin'
 
      # And I click on "Send Invite"
      click_on 'Send Invite'
      # Then I should be on /dashboard
      expect(current_path).to eq('/dashboard')
      # And I should see a message that says "Successfully sent invite!" 
      expect(page).to have_content("Successfully sent invite!")
      # (if the user has an email address associated with their github account)
      # Or I should see a message that says "The Github user you selected doesn't have an email 
      # address associated with their account."
    end
    xit 'user invites github user to app and displays a message to user that no email exists for github user handle' do
      # As a registered user
      # When I visit /dashboard
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      # And I click "Send an Invite"
      click_on 'Send an Invite'
      # Then I should be on /invite
      expect(current_path).to eq('/invite')
      
      # And when I fill in "Github Handle" with <A VALID GITHUB HANDLE>
      fill_in :github_handle, with: 'andrewetobin'
      # And I click on "Send Invite"
      click_on 'Send Invite'
      # Then I should be on /dashboard
      expect(current_path).to eq('/dashboard')
      # And I should see a message that says "Successfully sent invite!" 
      expect(page).to have_content("The Github user you selected doesn't have an email 
        # address associated with their account.")
      # (if the user has an email address associated with their github account)
      # Or I should see a message that says "The Github user you selected doesn't have an email 
      # address associated with their account."
    end
  end
end