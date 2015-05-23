class Excercise < ActiveRecord::Base
    belongs_to :preset, foreign_key: :excercise_preset_id, class_name: 'ExcercisePreset'
    belongs_to :program

    def present
        {
            name: self.preset.name,
            image: self.preset.image,
            duration: self.duration,
            repetitions: self.repetitions
        }
    end
end
