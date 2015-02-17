class AddFileToMethodFiles < ActiveRecord::Migration
  def self.up
    add_column :method_files, :doc_file_name,    :string
    add_column :method_files, :doc_content_type, :string
    add_column :method_files, :doc_file_size,    :integer
    add_column :method_files, :doc_updated_at,   :datetime
  end

  def self.down
    remove_column :method_files, :doc_file_name, :doc_content_type, :doc_file_size, :doc_updated_at
  end
end
