# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Race.destroy_all

User.create(username:"Ricky")
User.create(username:"Joe")

Race.create(name:"Orc", bio:"Orcs are carnivorous humanoids, standing approximately 5'11' to 6'2', weighing from 180 to 280 lbs. They are easily noticeable due to their green to gray skin, lupine ears, lower canines resembling boar tusks, and their muscular builds. Orcs stand in a bent over shape making them appear as ape-like humans.")
Race.create(name:"Grey Elf", bio:"Also known as Mountain Elves, these elves are the most noble of elves, yet also the most arrogant. They are of higher intellectual capabilities than other elves, but, despite the fact they are taller than high elves, they are physically weaker. They live in isolated mountain strongholds, and rarely allow access to outsiders. They have silver hair and amber eyes, or gold hair and violet eyes, and wear clothes of white, silver, yellow and gold, and usually wear regally colored cloaks.")
Race.create(name:"Worghest", bio:"According to the setting information, they vary in appearance. But in general they are thought to look like hairy goblinoids with sharp teeth, wolf-like snouts, blue hair and eyes that glow orange when excited. According to the books, worghest tend to wear hides and loinclothes.")


