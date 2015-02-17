class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end
  end
end
