class AddHomeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :home, foreign_key: true
  end
end
