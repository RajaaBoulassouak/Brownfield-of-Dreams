class AddColumnsToGithubToken < ActiveRecord::Migration[5.2]
  def change
    add_column :github_tokens, :uid, :string
    add_column :github_tokens, :provider, :string
  end
end
