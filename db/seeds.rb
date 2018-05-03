# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.create name: "Trio das meninas"
Team.create name: "Equipe de dança"
Team.create name: "Nação nada a ver"
Team.create name: "Teatro dos jovens"

Participant.create name: "Luíza Petra", team_id: 1
Participant.create name: "Outra Menina", team_id: 1
Participant.create name: "Menina Cantamuito", team_id: 1
Participant.create name: "Dançarino", team_id: 2
Participant.create name: "Dançarina", team_id: 2
Participant.create name: "Rafael Santana", team_id: 3
Participant.create name: "Mulequin", team_id: 3
Participant.create name: "Isabela Lima", team_id: 4
Participant.create name: "Rodrigo Santana", team_id: 4
Participant.create name: "Bruno Barbosa", team_id: 4
Participant.create name: "Luiz Felipe", team_id: 4
