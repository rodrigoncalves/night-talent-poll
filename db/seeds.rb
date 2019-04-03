# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Voting.first_or_create!

Team.create name: "Ana Laura"
Team.create name: "GRIS"
Team.create name: "Lívia e Vinícius"
Team.create name: "Marcos Daniel e Larissa Fernanda"
Team.create name: "Estêvão Duarte e Arthur Faustino"
Team.create name: "Os Talentos da Noite"
Team.create name: "Dinossauros e a Arca"
Team.create name: "Manu Cleo e Ana Luíza Monteiro"
Team.create name: "Claudia Santos e Guilherme Soares"
Team.create name: "Nova Geração"

Participant.create name: "Ana Luíza", team_id: 2
Participant.create name: "Ester Magalhães", team_id: 2
Participant.create name: "Lavínia", team_id: 2
Participant.create name: "Maria Angélica", team_id: 2
Participant.create name: "Sarah Gusmão", team_id: 2

Participant.create name: "Felipe Melchior", team_id: 6
Participant.create name: "Gabriel Campos", team_id: 6
Participant.create name: "Ivan Carlos", team_id: 6
Participant.create name: "Vitor Naves", team_id: 6

Participant.create name: "Rafael Santana", team_id: 7
Participant.create name: "Pedro Farias", team_id: 7
Participant.create name: "Ivan Carlos", team_id: 7
Participant.create name: "Vitor Prata", team_id: 7
Participant.create name: "Lucas Pessoa", team_id: 7
Participant.create name: "Wesley Assis", team_id: 7
Participant.create name: "Elisa Amaral", team_id: 7

Participant.create name: "Monique Oliveira", team_id: 10
Participant.create name: "Anna Luiza Dutra", team_id: 10
Participant.create name: "Rebecca Margarita", team_id: 10

for i in 1..300
  Poll.create code: SecureRandom.hex(4), value: 1
end

for i in 1..6
  Poll.create code: SecureRandom.hex(6), value: 7
end
