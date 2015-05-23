class CreateExcercises < ActiveRecord::Migration
  def change
    create_table :excercises do |t|
      t.integer :duration
      t.integer :repetitions
      t.integer :excercise_preset_id, null: false

      t.timestamps null: false
    end
  end
end
