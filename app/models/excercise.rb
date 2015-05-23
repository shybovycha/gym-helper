class Excercise < ActiveRecord::Base
    belongs_to :preset, foreign_key: :excercise_preset_id, class_name: 'ExcercisePreset'
    belongs_to :program

    def name
        self.preset.present? ? self.preset.name : nil
    end

    def image
        self.preset.present? ? self.preset.image : nil
    end

    def is_pause?
        self.name == 'pause'
    end

    def as_json
        {
            name: self.preset.name,
            image: self.preset.image,
            duration: self.duration,
            repetitions: self.repetitions
        }
    end
end
