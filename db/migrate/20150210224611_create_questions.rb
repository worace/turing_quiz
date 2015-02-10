class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :quiz_id

      t.timestamps null: false
    end
  end
end
