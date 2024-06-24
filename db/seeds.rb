require "open-uri"
require 'faker'

User.destroy_all
Event.destroy_all

user1 = User.create!(email: "hello@hotmail.com", password: "123456", name: "John", firstname: "Doe")

events = [
  {
    name: "Une soirée avec un chef étoilé",
    description: "Cuisine française",
    address: "123 rue de la faim 75018 Paris",
    date_time: "2024-06-30",
    image_url: "https://www.talence-athletisme.fr/wp-content/uploads/2022/05/Capture-de%CC%81cran-2022-05-19-a%CC%80-11.30.52-300x196.png",
    image_filename: "chefsoiree.png",
    image_content_type: "image/png"
  },
  {
    name: "Soirée Accrobranche",
    description: "Sensations fortes",
    address: "5 chemin de banga 33310 Bordeaux",
    date_time: "2024-07-10",
    image_url: "https://cdn.sortiraparis.com/images/1004/15516/133763-accronight.png",
    image_filename: "accro.png",
    image_content_type: "image/png"
  },
  {
    name: "Apéro Peinture",
    description: "Peinture et vin",
    address: "18 cours de la soif 33200 Margaux",
    date_time: "2024-07-24",
    image_url: "https://static.actu.fr/uploads/2019/03/25EpouseMoiCocotte_%C2%A9SightBySightPhotography_HAPPYPAINT.jpg",
    image_filename: "peinture.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Concert en plein air",
    description: "Musique locale",
    address: "Parc de la Musique, 123 avenue des Chansons, 75001 Paris",
    date_time: "2024-08-15",
    image_url: "https://www.pariszigzag.fr/wp-content/uploads/2024/04/arenes-lyriques-concert-montmartre-paris-zigzag-1.jpg",
    image_filename: "concert.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Soirée créole",
    description: "Rythmes créoles",
    address: "maison de la Réunion, 123 rue des saveurs, 75018 Paris",
    date_time: "2024-08-18",
    image_url: "https://www.destinationcocktails.fr/wp-content/uploads/2021/04/theme-soiree-creole-min.jpeg",
    image_filename: "creole.jpeg",
    image_content_type: "image/jpeg"
  },
  {
    name: "Nuit blanche musicale",
    description: "Fête de la musique",
    address: "tour Eiffel, 75007 Paris",
    date_time: "2024-08-22",
    image_url: "https://img-4.linternaute.com/e9-DdluJQ9o1pfbPPdXl_z3TkWg=/1500x/smart/cd8e4675a2c94d089ca136f2b5448123/ccmcms-linternaute/60299137.png",
    image_filename: "electro.png",
    image_content_type: "image/png"
  },
  {
    name: "Militer en pyjama pour les trains de nuit",
    description: "Pyjamas et trains",
    address: "rue du reveil pas matinal, 69000 Lyon",
    date_time: "2024-08-24",
    image_url: "https://cloudfront-eu-central-1.images.arcpublishing.com/leparisien/RB3QW5OBYRADHFY5FSC25I3T24.jpg",
    image_filename: "train.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Soirée déguisement improbable",
    description: "Déguisements",
    address: "rue de la troupe, 74000 Annecy",
    date_time: "2024-08-12",
    image_url: "https://www.nimesurbantrail.com/wp-content/uploads/2022/06/De%CC%81guisement-1-vainqueur.png",
    image_filename: "deguiser.png",
    image_content_type: "image/png"
  },
  {
    name: "Soyez kitch pour notre soirée des années 70",
    description: "Années 70",
    address: "impasse de la rupture, 69000 Lyon",
    date_time: "2024-08-01",
    image_url: "https://www.benmazue.com/wp-content/uploads/2023/12/kitch-4-1.jpg",
    image_filename: "kitch.jpg",
    image_content_type: "image/jpg"
  }
]

events.each do |event_data|
  event = Event.create!(
    name: event_data[:name],
    description: event_data[:description],
    address: event_data[:address],
    date_time: event_data[:date_time],
    open: true,
    user_id: user1.id
  )
  file = URI.open(event_data[:image_url])
  event.image.attach(io: file, filename: event_data[:image_filename], content_type: event_data[:image_content_type])
  event.save
  puts "#{event.name} created"
end
