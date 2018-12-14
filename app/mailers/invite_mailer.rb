class InviteMailer < ApplicationMailer
  
  def send_invitation(github_member_info, current_user)
    @user = current_user
    @github_member_name = github_member_info.name
    @github_member_email = github_member_info.email
    mail(to: github_member_email subject: 'Turing Tutorial Invitation')
  end
end