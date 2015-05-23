class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :day
      t.references :excercises, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
