class CreateCommunityConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :community_configs do |t|
      t.string :name
      t.text :description
      t.text :about
      t.integer :backgroundOne
      t.integer :backgroundTwo
      t.integer :backgroundThree

      t.timestamps
    end
  end
end
