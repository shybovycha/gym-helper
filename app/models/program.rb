class Program < ActiveRecord::Base
  has_many :excercises

  DAYS_OF_WEEK = [ 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' ]
end
