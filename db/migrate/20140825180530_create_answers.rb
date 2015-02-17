class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.references :comment

      t.timestamps
    end
    add_index :answers, :comment_id
  end
end
