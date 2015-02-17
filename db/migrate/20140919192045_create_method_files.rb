class CreateMethodFiles < ActiveRecord::Migration
  def change
    create_table :method_files do |t|
      t.text :descriprion

      t.timestamps
    end
  end
end
