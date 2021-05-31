# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(
  first_name: "Jean-Pierre",
  last_name: "Pernaud",
  email: "jean-pierre.pernauddd@tf1.fr",
  password: "123456"
)

user2 = User.create!(
  first_name: "Claire",
  last_name: "Chazal",
  email: "Claire.chazalll@tf1.fr",
  password: "123456"
)

codenames = Boardgame.create!(
  name: "Code Names",
  description: "Les deux Maîtres-Espions connaissent l’identité des 25 Informateurs sur la table, mais leurs Agents, eux, ne voient que leur Nom de Code. Les équipes rivalisent d’ingéniosité pour prendre contact avec tous leurs Informateurs en premier. Pour cela, les MaîtresEspions donnent un et un seul mot d’indice pouvant désigner plusieurs Noms de Code sur la table. Leurs Agents essayent alors de deviner les Noms de Code de leur couleur en évitant ceux de l’autre équipe. Et bien entendu, tout le monde veut éviter l’Assassin ! La première équipe qui trouve tous ses Informateurs gagne la partie.",
  category: "Espionnage",
  level: "Moyen",
  duration: 1
)

uno = Boardgame.create!(
  name: "Uno",
  description: "Pour gagner une manche de Uno, il faut être le premier joueur à n'avoir plus de cartes en main. Le jeu continue, manche par manche, jusqu'à ce qu'un joueur atteigne 500 points.",
  category: "Rapidité",
  level: "Facile",
  duration: 2
)

loup_garou = Boardgame.create!(
  name: "Loup Garou",
  description: "Thiercelieux semble être un village normal, mais chaque nuit certains villageois se transforment en loups-garous pour dévorer d'autres villageois. Chaque matin venu, les villageois découvrent une personne qui manque à l'appel et se réunissent pour tenter de démasquer les loups-garous se cachant parmi eux. Le matériel de jeu est formé uniquement de cartes carrées représentant chacune une identité au recto et une même illustration pour toutes les cartes au verso.",
  category: "Reflexion",
  level: "Difficile",
  duration: 2
)

