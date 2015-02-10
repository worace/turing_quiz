class CreateFurtherThoughts < ActiveRecord::Migration
  def change
    create_table :further_thoughts do |t|
      t.string :body
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
