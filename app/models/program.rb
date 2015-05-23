class Program < ActiveRecord::Base
  has_many :excercises
  belongs_to :user

  DAYS_OF_WEEK = [ 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' ]

  def present
    {
        day: DAYS_OF_WEEK[self.day],
        excercises: self.excercises.map(&:present)
    }
  end
end
