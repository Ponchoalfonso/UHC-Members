class AddAttachmentPhotoToRecents < ActiveRecord::Migration
  def self.up
    change_table :recents do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :recents, :photo
  end
end
