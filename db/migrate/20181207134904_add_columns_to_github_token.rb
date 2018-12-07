class AddColumnsToGithubToken < ActiveRecord::Migration[5.2]
  def change
    add_column :github_tokens, :uid, :string
    add_column :github_tokens, :provider, :string
    add_column :github_tokens, :username, :string
    add_column :github_tokens, :nickname, :string
    add_column :github_tokens, :avatar_url, :string
  end
end
