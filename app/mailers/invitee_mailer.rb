class UserMailer < ApplicationMailer
  
  def send_invitation(github_member_email)
    @github_member_email = github_member_email
    mail(to: github_member_email subject: 'Turing Tutorial Invitation')
  end
end