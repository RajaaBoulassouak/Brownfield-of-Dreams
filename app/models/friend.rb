class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friended_user, class_name: 'User'

  validate :realism

  private

  def realism
    return unless user_id == friended_user_id
    errors.add :user, 'Only a solipsist would friend themselves.'
  end
end
