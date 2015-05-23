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
end
