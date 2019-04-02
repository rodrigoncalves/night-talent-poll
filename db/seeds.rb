# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Voting.first_or_create!

Team.create name: "Azul"
Team.create name: "Vermelho"
Team.create name: "Amarelo"
Team.create name: "Laranja"
Team.create name: "Roxo"
Team.create name: "Rosa"
Team.create name: "Verde"
Team.create name: "Branco"
Team.create name: "Preto"

Participant.create name: "Mística", team_id: 1
Participant.create name: "Gênio", team_id: 1
Participant.create name: "Avatar", team_id: 1
Participant.create name: "Deadpool", team_id: 2
Participant.create name: "The flash", team_id: 2
Participant.create name: "Bob Esponja", team_id: 3
Participant.create name: "Minions", team_id: 3
Participant.create name: "Simpsons", team_id: 3
Participant.create name: "Garfield", team_id: 4
Participant.create name: "Nemo", team_id: 4
Participant.create name: "Barney", team_id: 5
Participant.create name: "Peppa", team_id: 6
Participant.create name: "Pantera cor de rosa", team_id: 6
Participant.create name: "Patrick", team_id: 6
Participant.create name: "Shrek", team_id: 7
Participant.create name: "Hulk", team_id: 7
Participant.create name: "Dona Branca", team_id: 8
Participant.create name: "Prof. Black", team_id: 9

for i in 1..200
  Poll.create code: SecureRandom.hex(4), value: 1
end

for i in 1..6
  Poll.create code: SecureRandom.hex(6), value: 7
end
