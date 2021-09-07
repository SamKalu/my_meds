# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
med_names = ["levothyroxine", "rosuvastatin", "albuterol", "esomeprazole", "fluticasone", "lisdexamfetamine", "rivotril", "xanax", "viagra"]
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

  5.times do
    Med.create!(
      name: med_names.sample,
      description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
      stock: rand(5..200),
      user_id: test_user.id
    )
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
