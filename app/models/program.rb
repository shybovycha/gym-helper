class Program < ActiveRecord::Base
  has_many :excercises
  belongs_to :user

  DAYS_OF_WEEK = [ 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' ]

  def as_json
    is_active = self.excercises.size > 0

    {
        day: DAYS_OF_WEEK[self.day],
        excercises: self.excercises.map(&:as_json),
        active: is_active
    }
  end

  def active?
    self.excercises.size > 0
  end

  def fill_excercises(params)
    self.excercises.destroy_all

    params.reject! { |excercise| excercise[:name].blank? }

    params.each do |excercise_params|
      preset = ExcercisePreset.find_by_name excercise_params[:name]
      duration = excercise_params[:duration]
      repetitions = excercise_params[:repetitions]

      self.excercises.create! preset: preset, duration: duration, repetitions: repetitions
    end
  end
end
