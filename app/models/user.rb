class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :programs

  after_create :init_weekly_programs

  def get_programs
    Program::DAYS_OF_WEEK.each_with_index.map do |day, day_index|
        [ day, self.programs.where(day: day_index) ]
    end.to_h
  end

  def program_for(day)
    day_index = Program::DAYS_OF_WEEK.index day
    self.programs.includes(:excercises).find_by_day(day_index)
  end

  private

  def init_weekly_programs
    Program::DAYS_OF_WEEK.each_with_index do |day, day_index|
        self.programs.create! day: day_index
    end
  end
end
