class CreateChores < ActiveRecord::Migration[6.0]
  def change
    create_table :chores do |t|
      t.string :name
      t.boolean :completed
      t.string :description
      t.references :home, null: false, foreign_key: true
      t.references :assignee, index: true, null:false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
