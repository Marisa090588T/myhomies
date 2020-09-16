class AddInviteTokenToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :invite_token, :string
    add_index :homes, :invite_token, unique: true
  end
end
