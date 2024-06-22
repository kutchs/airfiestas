# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require 'faker'

User.destroy_all
Event.destroy_all

user1 = User.create!(email: "hello@hotmail.com", password: "123456", name: "John", firstname: "Doe")

event1 = Event.create!(
  {
    name: "Une soirée avec un chef étoilé",
    description: "Découvrez les secrets de la cuisine française avec notre chef étoilé.",
    location: "123 rue de la faim 75018 Paris",
    date_time: "2024-06-30",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("https://www.talence-athletisme.fr/wp-content/uploads/2022/05/Capture-de%CC%81cran-2022-05-19-a%CC%80-11.30.52-300x196.png")
event1.image.attach(io: file, filename: "chefsoiree.png", content_type: "image/png")
event1.save
puts "#{event1.name} created"

event2 = Event.create!(
  {
    name: "Soirée Accrobranche",
    description: "Une soirée accrobranche pour les amateurs de sensations fortes.",
    location: "5 chemin de banga 33310 Bordeaux",
    date_time: "2024-07-10",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("https://cdn.sortiraparis.com/images/1004/15516/133763-accronight.png")
event2.image.attach(io: file, filename: "accro.png", content_type: "image/png")
event2.save
puts "#{event2.name} created"

event3 = Event.create!(
  {
    name: "Apéro Peinture",
    description: "Aprenez à peindre en dégustant un verre de vin",
    location: "18 cours de la soif33200 Margaux",
    date_time: "2024-07-24",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("./painting.jpg")
event3.image.attach(io: file, filename: "painting.jpg", content_type: "image/jpg")
event3.save
puts "#{event3.name} created"

event4 = Event.create!(
  {
    name: "Concert en plein air",
    description: "Profitez d'une soirée musicale en plein air avec des artistes locaux.",
    location: "Parc de la Musique, 123 avenue des Chansons, 75001 Paris",
    date_time: "2024-08-15",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("https://www.pariszigzag.fr/wp-content/uploads/2024/04/arenes-lyriques-concert-montmartre-paris-zigzag-1.jpg")
event4.image.attach(io: file, filename: "concert.jpg", content_type: "image/jpg")
event4.save
puts "#{event4.name} created"

event5 = Event.create!(
  {
    name: "Soirée créole",
    description: "Venez danser sur des rythmes créoles et déguster des plats typiques de la Réunion.",
    location: "maison de la Réunion, 123 rue des saveurs, 75018 Paris",
    date_time: "2024-08-18",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("./creole.jpg")
event5.image.attach(io: file, filename: "creole.jpg", content_type: "image/jpg")
event5.save
puts "#{event5.name} created"




event6 = Event.create!(
  {
    name: "Nuit blanche musicale",
    description: "Le bar de l'âne vous propose de vivre votre fête de la musique jusqu'au lever du soleil.",
    location: "tour Eiffel, 75007 Paris",
    date_time: "2024-08-22",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("./electro.jpg")
event6.image.attach(io: file, filename: "electro.jpg", content_type: "image/jpg")
event6.save
puts "#{event6.name} created"

event7 = Event.create!(
  {
    name: "Militer en pyjama pour les trains de nuit",
    description: "N'ayez plus honte de vos pyjamas ridicules et venez militer pour les trains de nuit.",
    location: "rue du reveil pas matinal, 69000 Lyon",
    date_time: "2024-08-24",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("https://res.cloudinary.com/dqbzdz3ob/image/upload/v1719067408/development/ux3z01ejwurluxk4iv35nismyz3p.jpg")
event7.image.attach(io: file, filename: "train.jpg", content_type: "image/jpg")
event7.save
puts "#{event7.name} created"

event8 = Event.create!(
  {
    name: "Soirée déguisement improbable",
    description: "Venez déguisé en votre personnage de film préféré, mais en version improbable.",
    location: "rue de la troupe, 74000 Annecy",
    date_time: "2024-08-12",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("./deguiser.png")
event8.image.attach(io: file, filename: "deguiser.png", content_type: "image/png")
event8.save
puts "#{event8.name} created"

event9 = Event.create!(
  {
    name: "Soyez kitch pour notre soirée des années 70",
    description: "Ce qui ne vous tuera pas, vous rendra plus populaire, rejoignez notre soirée animée par les groupes des 70 que vous n'avez jamais connu",
    location: "impasse de la rupture, 69000 Lyon",
    date_time: "2024-08-01",
    open: true,
    user_id: user1.id
  }
)
file = URI.open("./kitch.jpg")
event9.image.attach(io: file, filename: "kitch.jpg", content_type: "image/jpg")
event9.save
puts "#{event9.name} created"
