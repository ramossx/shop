class AddAttachmentPhotoToCategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :categories, :photo
  end
end
