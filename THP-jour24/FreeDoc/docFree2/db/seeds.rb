# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

city_array = []
8.times do 
  c = City.create(name: Faker::Address.city)
  city_array << c
end
puts "8 cities random ont été créées"

specialty_array = []
8.times do 
  s = Specialty.create(name: Faker::Job.field)
  specialty_array << s
end
puts "8 specialties random ont été créées"

doctor_array = []
8.times do 
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, 
    # specialty: specialty_array.sample, 
    city: city_array.sample)
  doctor_array << doctor
end
puts "8 Docteurs random ont été créés"

patient_array = []
12.times do 
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city_array.sample)
  patient_array << patient
end
puts "12 Patients random ont été crées"

appointment_array = []
14.times do
  appointment = Appointment.create(date: Faker::Date.in_date_period, doctor: doctor_array.sample, patient: patient_array.sample, city: city_array.sample)
  appointment_array << appointment
end
puts "14 Rdv random ont été crées"

Doctor.all.each do |doctor|
  doctor.specialties << Specialty.find(rand(1..specialty_array.length))
end
puts "Some doctor_specialies random ont été créés"

# 14.times do
#   DoctorSpecialty.create(doctor: doctor_array.sample, specialty: specialty_array.sample)
# end
# puts "14 doctor_specialies random ont été créés"