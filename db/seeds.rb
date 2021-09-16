puts "Destroying DB..."
User.destroy_all
puts "Destroyed DB"
puts "Creating new DB..."

puts "And God said, let there be Beni..."
ben = User.create!(
  email: "ben@a.com",
  password: "password",
  first_name: "Ben",
  last_name: "Ravindra",
  blood_type: "O-",
  birthday: Date.new(1982,1, 13)
)
ben_photo = File.open("#{Rails.root}/app/assets/images/profile_pics/ben.JPG")
ben.avatar.attach(io: ben_photo, filename: 'avatar_ben.jpg', content_type: 'image/jpg' )
puts "...and there was Beni"

puts "And God said, let there be John..."
john = User.create!(
  email: "john@w.com",
  password: "password",
  first_name: "John",
  last_name: "Wayne",
  blood_type: "O+",
  birthday: Date.new(1951,8, 10),
  carer_id: ben.id
)
john_photo = File.open("#{Rails.root}/app/assets/images/profile_pics/john_w.jpg")
john.avatar.attach(io: john_photo, filename: 'avatar_john.jpg', content_type: 'image/jpg' )
puts "...and there was John"
puts "God saw that John was good and he made Beni his carer. 'Take your meds' -said Beni, and so he did"

puts "Creating treatments for John"
blood_pressure = Treatment.create!(
  name: "Bloodpressure",
  user_id: john.id
)

vitamines = Treatment.create!(
  name: "Vitamines",
  user_id: john.id
)

pain_relief = Treatment.create!(
  name: "Pain relief",
  user_id: john.id
)

puts "Creating meds for John"
med_names = [ ["Astrovastax", "Against elevated blood cholesterol" , 10 ],
              ["CardiaxASS", "Thrombozyten-Aggeragtionshemmer", 80],
              ["Condrosulf", " Against pain and restriction of mobility of joints" , 90],
              ["Perindopril", "High blood pressure", 46],
              ["Ryzodec","Insulin", 15],
              ["Alkohol-Tupfer","For disinfection",87],
              ["Clickfine", "Senior vitamin", 60],
              ["Dafalgan", "Pain killer", 150],
              ["Microlet-next", "Against migraine", 73],
              ["Aspirin", "For Headache", 11],
              ["Actilife","Senior vitamin", 32],
              ["Antibiotic","Antibiotic", 52] ]

med_names.each do |med|
  med = Med.new(
    name: med[0],
    description: med[1],
    stock: med[2],
    user: john
  )
  img_photo = File.open("#{Rails.root}/app/assets/images/med_samples/#{med.name}.jpg")
  med.photo.attach(io: img_photo, filename: 'pillphoto.jpg', content_type: 'image/jpg' )
  med.save!
end

puts "#{Med.count} meds created"

puts "Creating schedule for John"
puts "Morning schedule"
s1 = Schedule.create!(
  times: ["08:00"],
  weekdays: ["monday", "tuesday", "wednesday", "thursday", "friday"],
  status: 0,
  med: john.meds.find_by(name: "Astrovastax"), 
  treatment: blood_pressure
)

s3 = Schedule.create!(
  times: ["08:00"],
  weekdays: ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"],
  status: 0,
  med: john.meds.find_by(name: "Actilife"), 
  treatment: vitamines
)

s4 = Schedule.create!(
  times: ["08:00"],
  weekdays: ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"],
  status: 0,
  med: john.meds.find_by(name: "Ryzodec"), 
  treatment: blood_pressure
)

s6 = Schedule.create!(
  times: ["08:00"],
  weekdays: ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"],
  status: 0,
  med: john.meds.find_by(name: "Perindopril"), 
  treatment: blood_pressure
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

