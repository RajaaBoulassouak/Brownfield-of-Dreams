class ChangeGhUserIdToBeAStringInGithubToken < ActiveRecord::Migration[5.2]
  def change
    change_column :github_tokens, :gh_user_id, :string
  end
end
