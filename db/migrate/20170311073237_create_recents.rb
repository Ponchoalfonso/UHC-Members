class CreateRecents < ActiveRecord::Migration[5.0]
  def change
    create_table :recents do |t|
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
