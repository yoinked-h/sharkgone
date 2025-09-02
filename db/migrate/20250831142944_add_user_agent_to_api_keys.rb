class AddUserAgentToApiKeys < ActiveRecord::Migration[8.0]
  def change
    add_column :api_keys, :last_user_agent, :string, null: true
  end
end
