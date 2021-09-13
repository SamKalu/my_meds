treatment_names = ["cancer", "alzheimer's", "parkinson", "blood pressure"]

puts "Destroying DB..."
User.destroy_all
puts "Destroyed DB"
puts "Creating new DB..."

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

  med_names = ["levothyroxine", "rosuvastatin", "albuterol", "esomeprazole", "fluticasone", "lisdexamfetamine", "rivotril", "xanax", "viagra"]
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

  2.times do
    Contact.create!(
      full_name: Faker::Name.name,
      description: Faker::Relationship.familial,
      phone: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email,
      user_id: test_user.id
    )
  end

  puts "Created #{test_user.contacts.count} contacts for #{test_user.first_name}"

  3.times do
    Treatment.create!(
      name: treatment_names.sample,
      user_id: test_user.id
    )
  end

  puts "Created #{test_user.treatments.count} treatments for #{test_user.first_name}"

  3.times do
    Schedule.create!(
      med: test_user.meds.sample,
      treatment: test_user.treatments.sample
    )
  end

  puts "Created schedules for #{test_user.first_name}"
end
puts "DB Created succesfully!"
