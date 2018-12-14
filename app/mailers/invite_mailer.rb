class InviteMailer < ApplicationMailer
  
  def invitation(github_member, current_user)
    @user = current_user
    @github_member = github_member

    mail(to: github_member.email, subject: 'Turing Tutorial Invitation')
  end
end