class AddAttachmentAvatarBannerToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :avatar
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :users, :avatar
    remove_attachment :users, :banner
  end
end
