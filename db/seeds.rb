require "open-uri"
require 'faker'

User.destroy_all
Event.destroy_all

user1 = User.create!(email: "hello@hotmail.com", password: "123456", name: "John", firstname: "Doe")

events_data = [
  {
    name: "Soirée avec un chef étoilé",
    description: "Découvrez les secrets de la cuisine française avec notre chef étoilé.",
    location: "123 rue de la faim 75018 Paris",
    date_time: "2024-06-30 19:00",
    image_url: "https://www.talence-athletisme.fr/wp-content/uploads/2022/05/Capture-de%CC%81cran-2022-05-19-a%CC%80-11.30.52-300x196.png",
    image_filename: "chefsoiree.png",
    image_content_type: "image/png"
  },
  {
    name: "Soirée Accrobranche",
    description: "Une soirée accrobranche pour les amateurs de sensations fortes.",
    location: "5 chemin de banga 33310 Bordeaux",
    date_time: "2024-07-10 20:00",
    image_url: "https://cdn.sortiraparis.com/images/1004/15516/133763-accronight.png",
    image_filename: "accro.png",
    image_content_type: "image/png"
  },
  {
    name: "Apéro Peinture",
    description: "Apprenez à peindre en dégustant un verre de vin",
    location: "18 cours de la soif 33200 Margaux",
    date_time: "2024-07-24 18:30",
    image_url: "https://static.actu.fr/uploads/2019/03/25EpouseMoiCocotte_%C2%A9SightBySightPhotography_HAPPYPAINT.jpg",
    image_filename: "peinture.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Concert en plein air",
    description: "Profitez d'une soirée musicale en plein air avec des artistes locaux.",
    location: "123 avenue des Chansons, 75001 Paris",
    date_time: "2024-08-15 21:00",
    image_url: "https://www.pariszigzag.fr/wp-content/uploads/2024/04/arenes-lyriques-concert-montmartre-paris-zigzag-1.jpg",
    image_filename: "concert.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Soirée créole",
    description: "Venez danser sur des rythmes créoles et déguster des plats typiques de la Réunion.",
    location: "123 rue des saveurs, 75018 Paris",
    date_time: "2024-08-18 19:30",
    image_url: "https://www.destinationcocktails.fr/wp-content/uploads/2021/04/theme-soiree-creole-min.jpeg",
    image_filename: "creole.jpeg",
    image_content_type: "image/jpeg"
  },
  {
    name: "Nuit blanche musicale",
    description: "Le bar de l'âne vous propose de vivre votre fête de la musique jusqu'au lever du soleil.",
    location: "Tour Eiffel, 75007 Paris",
    date_time: "2024-08-22 22:00",
    image_url: "https://img-4.linternaute.com/e9-DdluJQ9o1pfbPPdXl_z3TkWg=/1500x/smart/cd8e4675a2c94d089ca136f2b5448123/ccmcms-linternaute/60299137.png",
    image_filename: "electro.png",
    image_content_type: "image/png"
  },
  {
    name: "Soirée pyjama pour les trains de nuit",
    description: "N'ayez plus honte de vos pyjamas ridicules et venez militer pour les trains de nuit.",
    location: "Rue du reveil pas matinal, 69000 Lyon",
    date_time: "2024-08-24 20:30",
    image_url: "https://cloudfront-eu-central-1.images.arcpublishing.com/leparisien/RB3QW5OBYRADHFY5FSC25I3T24.jpg",
    image_filename: "train.jpg",
    image_content_type: "image/jpg"
  },
  {
    name: "Soirée déguisement improbable",
    description: "Venez déguisé en votre personnage de film préféré, mais en version improbable.",
    location: "Rue de la troupe, 74000 Annecy",
    date_time: "2024-08-12 19:00",
    image_url: "https://www.nimesurbantrail.com/wp-content/uploads/2022/06/De%CC%81guisement-1-vainqueur.png",
    image_filename: "deguiser.png",
    image_content_type: "image/png"
  },
  {
    name: "Soyez kitch années 70",
    description: "Ce qui ne vous tuera pas, vous rendra plus populaire, rejoignez notre soirée animée par les groupes des 70 que vous n'avez jamais connu",
    location: "Impasse de la rupture, 69000 Lyon",
    date_time: "2024-08-01 21:30",
    image_url: "https://www.benmazue.com/wp-content/uploads/2023/12/kitch-4-1.jpg",
    image_filename: "kitch.jpg",
    image_content_type: "image/jpg"
  }
]

ActiveRecord::Base.transaction do
  events_data.each do |event_data|
    event = Event.create!(
      name: event_data[:name],
      description: event_data[:description],
      location: event_data[:location],
      date_time: event_data[:date_time],
      open: true,
      user_id: user1.id
    )

    file = URI.open(event_data[:image_url])
    event.image.attach(io: file, filename: event_data[:image_filename], content_type: event_data[:image_content_type])
    event.save
    puts "#{event.name} created"
  end
end
