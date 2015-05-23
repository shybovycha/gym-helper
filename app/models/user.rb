class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :programs

  after_create :init_weekly_programs

  def fetch_programs(options = { present_as: :hash })
    Program::DAYS_OF_WEEK.each_with_index.map do |day, day_index|
        program = self.programs.includes(:excercises).find_by_day day_index

        program = program.as_json if options[:present_as] == :json

        [ day, program ]
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
