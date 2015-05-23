class Program < ActiveRecord::Base
  has_many :excercises
  belongs_to :user

  DAYS_OF_WEEK = [ 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' ]
end
