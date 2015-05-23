class CreateExcercisePresets < ActiveRecord::Migration
  def change
    create_table :excercise_presets do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
