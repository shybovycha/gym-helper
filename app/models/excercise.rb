class Excercise < ActiveRecord::Base
    belongs_to :preset, foreign_key: :excercise_preset_id, class_name: 'ExcercisePreset'
    belongs_to :program
end
