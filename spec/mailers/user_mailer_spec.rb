require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    before(:each) do
      @user = create(:user)
    end
    let(:email) { UserMailer.account_activation(@user) }
    
    it 'renders headers' do
      expect(email.subject).to eq('Account Activation')
      expect(email.to).to eq([@user.email])
      expect(email.from).to eq(['no-reply@activate.io'])
    end

    it 'renders body' do
      expect(email.body.encoded).to match('Hello')
      expect(email.body.encoded).to include(@user.activation_token)
    end
  end
end