class CreateShortcuts < ActiveRecord::Migration[6.0]
  def change
    create_table :shortcut_urls do |t|
      t.string :token, null: false
      t.text :redirect_to, null: false
      t.timestamp :last_visited_at

      t.timestamps
    end

    add_index :shortcut_urls, :token, unique: true
  end
end
