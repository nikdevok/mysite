class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.text :description

      t.timestamps
    end
  end
end
