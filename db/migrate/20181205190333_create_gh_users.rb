class CreateGhUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :gh_users do |t|
      t.integer :gh_id
      t.string :name
      t.string :link
      t.string :token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end