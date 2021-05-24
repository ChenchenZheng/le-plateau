# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
boardgame = Boardgame.create(
  name: "Code Names",
  description: "Les deux Maîtres-Espions connaissent l’identité des 25 Informateurs sur la table,
mais leurs Agents, eux, ne voient que leur Nom de Code. Les équipes rivalisent d’ingéniosité
pour prendre contact avec tous leurs Informateurs en premier. Pour cela, les MaîtresEspions donnent un et un seul mot d’indice pouvant désigner plusieurs Noms de Code sur la table. Leurs Agents essayent alors de deviner les Noms de Code de leur couleur
en évitant ceux de l’autre équipe. Et bien entendu, tout le monde veut éviter l’Assassin !
La première équipe qui trouve tous ses Informateurs gagne la partie.",
  category: "Espionnage",
  level: "Intermediate",
  duration: 1

)

event = Event.create(

)
