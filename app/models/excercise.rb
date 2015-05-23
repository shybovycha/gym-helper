class Excercise < ActiveRecord::Base
    belongs_to :excercise_preset
    belongs_to :program
end
