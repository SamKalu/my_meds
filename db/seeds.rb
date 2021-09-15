
puts "Destroying DB..."
User.destroy_all
puts "Destroyed DB"
puts "Creating new DB..."

puts "And God said, let there be Beni..."
ben = User.create!(
  email: "ben@a.com",
  password: "password",
  first_name: "Ben",
  last_name: "A",
  blood_type: Faker::Blood.group,
  birthday: Date.new(1982, 11, 13)
)
ben_photo = File.open("#{Rails.root}/app/assets/images/profile_pics/ben.JPG")
ben.avatar.attach(io: ben_photo, filename: 'avatar_ben.jpg', content_type: 'image/jpg' )
puts "...and there was Beni"

puts "And God said, let there be Walter..."
walter = User.create!(
  email: "walter@k.com",
  password: "password",
  first_name: "Walter",
  last_name: "K",
  blood_type: Faker::Blood.group,
  birthday: Date.new(1941, 12, 24),
  carer_id: ben.id
)
walter_photo = File.open("#{Rails.root}/app/assets/images/profile_pics/walter.jpeg")
walter.avatar.attach(io: walter_photo, filename: 'avatar_walter.jpg', content_type: 'image/jpg' )
puts "...and there was Walter"
puts "God saw that Walter was good and he made Beni his carer. 'Take your meds' -said Beni, and so he did"

puts "Creating meds for Walter"
med_names = [ ["Astrovastax", "Gegen erhöhte Blutcholesterinwerte" , 10 ], 
              ["Betmiga", "Reduziert die Aktivität der überaktiven Harnblase", 56],
              ["CardiaxASS", "Thrombozyten-Aggeragtionshemmer", 80],
              ["Condrosulf", "Gegen Schmerzen und Einschränkung der Beweglichkeit der Gelenke" , 90],
              ["Duodart","Gegegen Prostatavergrösserung",103],
              ["Perindopril-Indapamid-Mepha", "Gegen arterieller Hypertonie / Bluthochdruck ", 46],
              ["Ryzodec","Insulin", 15],
              ["Alkohol-Tupfer","Zur Desinfektion der Haut vor dem Spritzen",87],
              ["Clickfine", "Nadel für Insulin-Pens", 60],
              ["Contour-next", " Sensoren (zur Messung des Blutzuckers)", 150],
              ["Microlet", "Lanzetten", 150],
              ["Microlet-next", "Stecher für Lanzetten", 73],
              ["Contour-next-ONE", "Blutzucker-Messgerät", 11],
              ["Actilife","Vitamine", 32] ]

med_names.each do |med|
  med = Med.new(
    name: med[0],
    description: med[1],
    stock: med[2],
    user_id: walter.id
  )
  img_photo = File.open("#{Rails.root}/app/assets/images/med_samples/#{med.name}.jpg")
  med.photo.attach(io: img_photo, filename: 'pillphoto.jpg', content_type: 'image/jpg' )
  med.save!
end

puts "Creating treatments for Walter"
Treatment.create!(
  name: "Bloodpressure",
  user_id: walter.id
)

Treatment.create!(
  name: "Vitamines",
  user_id: walter.id
)

Treatment.create!(
  name: "Pain relief",
  user_id: walter.id
)

puts "Creating fake users"

5.times do
  test_user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    blood_type: Faker::Blood.group,
    birthday: Faker::Date.between(from: 80.years.ago, to: 52.years.ago)
  )
  
  puts "Created a User called #{test_user.first_name}"
  puts "Finding #{test_user.first_name}'s meds and pictures for them..."

  med_names = ["levothyroxine", "rosuvastatin", "albuterol", "esomeprazole", "fluticasone", "lisdexamfetamine", "rivotril", "xanax", "viagra", "Simvastatin", "Omeprazole", "Metformin", "Azithromycin"]
  5.times do
    med = Med.new(
      name: med_names.shuffle!.pop,
      description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
      stock: rand(5..200),
      user_id: test_user.id
    )
    img_photo = URI.open("https://source.unsplash.com/1600x900/?pills")
    med.photo.attach(io: img_photo, filename: 'pillphoto.png', content_type: 'image/png' )
    med.save!
  end
  
  puts "Created #{test_user.meds.count} meds for #{test_user.first_name}"
  
  1.times do
    Contact.create!(
      full_name: Faker::Name.name,
      description: Faker::Relationship.familial,
      phone: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email,
      user_id: test_user.id
    )
  end
  
  puts "Created #{test_user.contacts.count} contacts for #{test_user.first_name}"
  
  treatment_names = ["cancer", "alzheimer's", "parkinson", "blood pressure"]
  1.times do
    Treatment.create!(
      name: treatment_names.shuffle!.pop,
      user_id: test_user.id
    )
  end

  puts "Created #{test_user.treatments.count} treatments for #{test_user.first_name}"
end
puts "DB Created succesfully!"

