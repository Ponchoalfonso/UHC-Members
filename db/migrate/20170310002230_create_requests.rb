class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.integer :age
      t.string :nickname
      t.text :minecraftUUID
      t.text :foundUs
      t.text :requestReason
      t.string :email
      t.string :status
      t.string :ip

      t.timestamps
    end
  end
end
