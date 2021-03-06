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

    def repetitions_text
        self.repetitions && "#{self.repetitions} times"
    end

    def duration_text
        self.duration && Time.humanize_timespan(self.duration)
    end

    def as_json
        repetitions_text = self.repetitions_text
        duration_text = self.duration_text

        {
            name: self.preset.name,
            image: self.preset.image,
            duration: duration,
            repetitions: repetitions,
            duration_text: duration_text,
            repetitions_text: repetitions_text
        }
    end
end
