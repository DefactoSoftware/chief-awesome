class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
