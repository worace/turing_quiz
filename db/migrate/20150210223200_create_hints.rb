class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :body
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
