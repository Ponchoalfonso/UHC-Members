class AddAttachmentLogoToCommunityConfigs < ActiveRecord::Migration
  def self.up
    change_table :community_configs do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :community_configs, :logo
  end
end
