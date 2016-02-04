class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
