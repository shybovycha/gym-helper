puts "Creating excercise presets..."

running_preset = ExcercisePreset.create! name: 'running', image: 'running'
jumping_preset = ExcercisePreset.create! name: 'jumping', image: 'jumping'
pause_preset = ExcercisePreset.create! name: 'pause', image: 'rest'

puts "Created #{ExcercisePreset.count} excercise presets"

puts "Creating sample user..."

u = User.create! email: 'moo@foo.bar', password: 'moofoo', password_confirmation: 'moofoo'

puts "Filling sample users with sample program..."

u.program_for('monday').excercises.create! preset: running_preset, duration: 20.minutes
u.program_for('monday').excercises.create! preset: jumping_preset, repetitions: 30

puts "We're ready to rock!"