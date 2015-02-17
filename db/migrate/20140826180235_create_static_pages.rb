class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.text :body
      t.string :page_type

      t.timestamps
    end
  end
end
