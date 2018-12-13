class AddActivationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activ_token, :string
  end
end
