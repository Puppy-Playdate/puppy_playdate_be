class AddOauthTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :oauth_token, :string
  end
end
