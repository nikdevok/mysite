class AddImageToAchievements < ActiveRecord::Migration
  def self.up
    add_column :achievements, :img_file_name,    :string
    add_column :achievements, :img_content_type, :string
    add_column :achievements, :img_file_size,    :integer
    add_column :achievements, :img_updated_at,   :datetime
  end

  def self.down
    remove_column :achievements, :img_file_name, :img_content_type, :img_file_size, :img_updated_at
  end
end
