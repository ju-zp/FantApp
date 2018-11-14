# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
User.destroy_all
Race.destroy_all
Chatroom.destroy_all
ChatroomUser.destroy_all
Character.destroy_all

User.create(username:"ricky", password:"admin")
User.create(username:"joe", password:"admin")

Race.create(name:"Orc", bio:"Orcs are carnivorous humanoids, standing approximately 5'11' to 6'2', weighing from 180 to 280 lbs. They are easily noticeable due to their green to gray skin, lupine ears, lower canines resembling boar tusks, and their muscular builds. Orcs stand in a bent over shape making them appear as ape-like humans.", image_url: "orc.jpg")
Race.create(name:"Grey Elf", bio:"Also known as Mountain Elves, these elves are the most noble of elves, yet also the most arrogant. They are of higher intellectual capabilities than other elves, but, despite the fact they are taller than high elves, they are physically weaker. They live in isolated mountain strongholds, and rarely allow access to outsiders. They have silver hair and amber eyes, or gold hair and violet eyes, and wear clothes of white, silver, yellow and gold, and usually wear regally colored cloaks.", image_url: "elf.jpg")
Race.create(name:"Wargs", bio:"Wargs were a breed of wolves in Middle-earth who lived in the Misty Mountains and were captured and used especially by orcs of Isengard and Mordor in the Third Age. Though wargs were not specifically evil themselves, they were known to be exclusively used by or alongside Goblins, sometimes as their steeds.", image_url: "warg.jpg")
Race.create(name:"Wizard", bio:"The Wizards, initially known as the Istari, were five Maiar spirits sent to Middle-earth as human forms to aid the Free Peoples against the threat of Sauron.", image_url: "wizard.jpg")
Race.create(name:"Hobbit", bio:"hobbits are between two and four feet (0.61–1.22 m) tall, the average height being three feet six inches (107 cm). They dress in bright colours, favouring yellow and green. Nowadays (according to Tolkien's fiction), they are usually shy, but are nevertheless capable of great courage and amazing feats under the proper circumstances. They are adept at throwing stones.", image_url: "hobbit.jpg")
