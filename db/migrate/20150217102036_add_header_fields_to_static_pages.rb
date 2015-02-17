class AddHeaderFieldsToStaticPages < ActiveRecord::Migration
  def change
    add_column :static_pages, :title, :string
    add_column :static_pages, :menu_title, :string
  end
end
