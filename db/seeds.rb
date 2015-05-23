running_preset = ExcercisePreset.create! name: 'running', image: 'running'
jumping_preset = ExcercisePreset.create! name: 'jumping', image: 'jumping'

u = User.create! email: 'moo@foo.bar', password: 'moofoo', password_confirmation: 'moofoo'
u.program_for('monday').excercises.create! preset: running_preset, duration: 20.minutes
u.program_for('monday').excercises.create! preset: jumping_preset, repetitions: 30