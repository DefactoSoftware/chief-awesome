class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :question_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_foreign_key :answers, :questions
    add_foreign_key :answers, :users
  end
end
