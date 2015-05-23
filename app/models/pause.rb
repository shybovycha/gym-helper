class Pause < Excercise
    after_initialize :set_preset

    def name
        self.preset.present? ? self.preset.name : 'pause'
    end

    def image
        self.preset.present? ? self.preset.image : 'rest'
    end

    def preset=(preset)
        "Could not assign preset for a Pause other than a Pause"
    end

    def duration_only?
        true
    end

    def as_json
        {
            name: self.preset.name,
            image: self.preset.image,
            duration: self.duration,
            repetitions: nil
        }
    end

    private

    def set_preset
        self.preset = ExcercisePreset.find_by_name 'pause'
        self.duration = 30 # default duration of 30 seconds
    end
end
