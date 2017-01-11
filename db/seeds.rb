Role.create!(name: "Organizer")
Role.create!(name: "New Parent")
Role.create!(name: "Villager")

category1 = Category.create!(name: "Meals")
category2 = Category.create!(name: "Errands")
category3 = Category.create!(name: "Pampering")
category4 = Category.create!(name: "Visitors")
category5 = Category.create!(name: "Chores")
category6 = Category.create!(name: "Pet Care")
category7 = Category.create!(name: "Babysitting")

category1.tasks.create!(name: "Breakfast")
category1.tasks.create!(name: "Lunch")
category1.tasks.create!(name: "Dinner")

category2.tasks.create!(name: "Groceries")
category2.tasks.create!(name: "Prescriptions")
category2.tasks.create!(name: "Other")

category3.tasks.create!(name: "Salon trip")
category3.tasks.create!(name: "Mani/Pedi")
category3.tasks.create!(name: "Massage")

category4.tasks.create!(name: "Happy Hour")
category4.tasks.create!(name: "Chat Online")
category4.tasks.create!(name: "Play Date")

category5.tasks.create!(name: "House cleaning")
category5.tasks.create!(name: "Detail car")
category5.tasks.create!(name: "Laundry")

category6.tasks.create!(name: "Vet trip")
category6.tasks.create!(name: "Walk dog")
category6.tasks.create!(name: "Clean litterboxes")

category7.tasks.create!(name: "Mother's helper")
category7.tasks.create!(name: "Parents' night out")
category7.tasks.create!(name: "Help us get a nap")
