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
        repetitions = self.repetitions && "#{self.repetitions} times"
        duration = self.duration && Time.humanize_timespan(self.duration)

        {
            name: self.preset.name,
            image: self.preset.image,
            duration: duration,
            repetitions: repetitions
        }
    end
end
