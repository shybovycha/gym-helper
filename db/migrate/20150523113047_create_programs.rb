class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :day
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
